import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/services/supabaseservice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ktaapp/services/apiwilayahservice.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RegisterKtaController extends GetxController {
  static RegisterKtaController get instance => Get.find();
  final GlobalKey<FormState> stateForm = GlobalKey<FormState>();
  final namaTextEditingController = TextEditingController();
  final digitPertama = TextEditingController();
  final digitKedua = TextEditingController();
  final digitKetiga = TextEditingController();
  final digitKeEmpat = TextEditingController();
  final nomorIndukTextEditingController = TextEditingController();
  final _supabaseService = SupabaseService();
  final userId = AuthenticationRepository.instance.authUser?.id;
  final RxList daftarProvinsi = [].obs;
  final RxList daftarKabupaten = [].obs;
  final RxList daftarKecamatan = [].obs;
  final RxString provinsi = ''.obs;
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
    getNoTelp();
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

  Future<String> getNoTelp() async {
    final id = SupBase.supabase.auth.currentUser?.id;
    final noTelp = await _supabaseService.getUserPhone(id!);
    print('abc');
    return noTelp.toString();
  }

  Future<void> saveDataAnggota({required String role}) async {
    try {
      if (!stateForm.currentState!.validate()) {
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
        final imageExtension = image!.path.split('.').last.toLowerCase();
        String idNumber = nomorIndukTextEditingController.text.trim();
        String firstFourDigits = idNumber.substring(0, 4);
        PostgrestResponse order =
            await _supabaseService.getFirstFourDigits(firstFourDigits);
        int totalNikSama = order.count + 1;
        String memberNumber =
            '${firstFourDigits.toString().padRight(4, '0')}-${totalNikSama.toString().padLeft(6, '0')}';
        final imagePath = '/$userId/profile';
        await _supabaseService.uploadImage(
            userId!, memberNumber, image, imageExtension);
        final imageUrl = SupBase.supabase.storage
            .from('foto_anggota')
            .getPublicUrl(imagePath);
        String noPensiun =
            '${digitPertama.text}-${digitKedua.text}-${digitKetiga.text}-${digitKeEmpat.text}';
        String noTelp = await getNoTelp();
        await _supabaseService.saveDataAnggota(
            nama: namaTextEditingController.text,
            nomorPensiun: noPensiun,
            nik: nomorIndukTextEditingController.text,
            memberNumber: memberNumber,
            imageUrl: imageUrl,
            provinsi: provname,
            kabupaten: kabname,
            kecamatan: kecname,
            userRole: role,
            noTelp: noTelp);
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
      Get.back();
      Get.snackbar("Error", "Gagal menyimpan data siswa");
      throw '$e';
    }
  }

  void resetImageSelection() {
    pickedFile.value = null;
    isImageSelected = false;
    update();
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

  Future<File> compressImage(File file, int maxSizeKB) async {
    try {
      openDialig();
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
    } catch (e) {
      Get.back();
      throw '$e';
    } finally {
      Get.back();
    }
  }
}


/*
Future<void> addUser(User user) async {
  final db = FirebaseFirestore.instance;
  final provinceRef = db.collection('provinces').doc(user.provinceCode.toString());

  await db.runTransaction((transaction) async {
    final provinceDoc = await transaction.get(provinceRef);
    if (!provinceDoc.exists) {
      // Initialize the order field for a new province
      transaction.set(provinceRef, {'order': 1});
      final newOrder = 1;
      final memberNumber = generateMemberNumber(user.provinceCode, newOrder);
      final userRef = db.collection('users').doc();
      transaction.set(userRef, {...user.toMap(), 'memberNumber': memberNumber});
    } else {
      final newOrder = (provinceDoc.data()['order'] as int) + 1;
      final memberNumber = generateMemberNumber(user.provinceCode, newOrder);
      final userRef = db.collection('users').doc();
      transaction.set(userRef, {...user.toMap(), 'memberNumber': memberNumber});
      transaction.update(provinceRef, {'order': newOrder});
    }
  });
}

String generateMemberNumber(int provinceCode, int order) {
  final orderString = order.toString().padLeft(4, '0');
  return '$provinceCode$orderString';
}
*/
