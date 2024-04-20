import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/services/apiwilayahservice.dart';
import 'package:ktaapp/services/supabaseservice.dart';
import 'package:path_provider/path_provider.dart';

class EditKtaController extends GetxController {
  static EditKtaController get instance => Get.find();
  final GlobalKey<FormState> formState = GlobalKey<FormState>();
  final namaTextEditingController = TextEditingController();
  final digitPertama = TextEditingController();
  final digitKedua = TextEditingController();
  final digitKetiga = TextEditingController();
  final digitKeempat = TextEditingController();
  final nomorIndukTextEditingController = TextEditingController();
  final _supabaseService = SupabaseService();
  final RxList daftarProvinsi = [].obs;
  final RxList daftarKabupaten = [].obs;
  final RxList daftarKecamatan = [].obs;
  final RxString provinsi = ''.obs;
  final RxString urlFoto = ''.obs;
  late String imageUrl;
  final RxMap _data = {}.obs;
  final RxString userId = ''.obs;
  final RxString memberNumber = ''.obs;
  Map get data => _data;
  String get provname => provinsi.value;
  final RxString kabupaten = ''.obs;
  String get kabname => kabupaten.value;
  final RxString kecamatan = ''.obs;
  String get kecname => kecamatan.value;
  Rx<File?> pickedFile = Rx<File?>(null);
  File? get imageFile => pickedFile.value;
  bool isImageSelected = false;
  XFile? image;

  @override
  void onInit() {
    super.onInit();
    fetchProvince();
  }

  void fetchProvince() async {
    daftarProvinsi.value = await ApiService.fetchProvinsi();
  }

  void fetchKabupaten(String kodeProv) async {
    daftarKabupaten.value = await ApiService.fetchKabupaten(kodeProv);
  }

  void fetchKecamatan(String kodeKab) async {
    daftarKecamatan.value = await ApiService.fetchKecamatan(kodeKab);
  }

  Future<void> captureImageFromCamera() async {
    if (isImageSelected) {
      resetImageSelection();
    }
    image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedFile.value = File(image!.path);
      pickedFile.value = await compressImage(File(image!.path), 100);
      isImageSelected = true;
      update();
    }
  }

  Future<void> pickImageFromGallery() async {
    if (isImageSelected) {
      resetImageSelection();
    }
    image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedFile.value = File(image!.path);
      pickedFile.value = await compressImage(File(image!.path), 100);
      isImageSelected = true;
      update();
    }
  }

  void resetImageSelection() {
    pickedFile.value = null;
    isImageSelected = false;
    update();
  }

  Future<File> compressImage(File file, int maxSizeKB) async {
    img.Image? image = img.decodeImage(file.readAsBytesSync());
    int quality = 100;
    List<int> compressedImage = file.readAsBytesSync();

    while (compressedImage.length > maxSizeKB * 1024) {
      compressedImage = img.encodeJpg(image!, quality: quality);
      quality -= 10;
      if (quality <= 0) break;
    }

    Directory tempDir = await getTemporaryDirectory();
    File compressedFile = File('${tempDir.path}/compressed_image.jpg');
    await compressedFile.writeAsBytes(compressedImage);
    return compressedFile;
  }

  Future<void> updateDataAnggota() async {
    try {
      if (!formState.currentState!.validate()) {
        return;
      } else if (provname == '' || kabname == '' || kecname == '') {
        Get.snackbar('Error', 'Harap lengkapi form ini.',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.warning_rounded,
              color: Colors.white,
            ));
      } else {
        openDialig();
        // print(pickedFile.value);
        if (pickedFile.value == null) {
          imageUrl = urlFoto.value;
        } else if (pickedFile.value != null) {
          final imageExtension = image!.path.split('.').last.toLowerCase();
          final imagePath = '/$userId/profile';
          await _supabaseService.uploadImage(
              userId.value, memberNumber.value, image, imageExtension);
          imageUrl = SupBase.supabase.storage
              .from('foto_anggota')
              .getPublicUrl(imagePath);
        }
        // print(imageUrl);

        String noPensiun =
            '${digitPertama.text}-${digitKedua.text}-${digitKetiga.text}-${digitKeempat.text}';
        await _supabaseService.updateDataAnggota(
          userId.value,
          nama: namaTextEditingController.text,
          nomorPensiun: noPensiun,
          nik: nomorIndukTextEditingController.text,
          imageUrl: imageUrl,
          provinsi: provname,
          kabupaten: kabname,
          kecamatan: kecname,
        );
        Get.back();
        Get.snackbar('Success', 'Data anggota berhasil disimpan',
            backgroundColor: Colors.green[800],
            colorText: Colors.white,
            icon: const Icon(
              Icons.check_circle,
              color: Colors.white,
            ));
        Future.delayed(const Duration(seconds: 2), () {
          Get.to(() => const NavigationPage());
        });
      }
    } catch (e) {
      throw 'error : $e';
    }
  }

  void openDialig() {
    Get.dialog(
        Dialog(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: const SizedBox(
            width: 100,
            height: 150,
            child: SpinKitCubeGrid(
              size: 100,
              color: Colors.white,
            ),
          ),
        ),
        barrierDismissible: false);
  }
}
