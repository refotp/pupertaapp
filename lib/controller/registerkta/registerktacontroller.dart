import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktaapp/services/apiwilayahservice.dart';
import 'package:ktaapp/services/firebaseservice.dart';

class RegisterKtaController extends GetxController {
  static RegisterKtaController get instance => Get.find();

  final namaTextEditingController = TextEditingController();
  final digitPertama = TextEditingController();
  final digitKedua = TextEditingController();
  final digitKetiga = TextEditingController();
  final digitKeEmpat = TextEditingController();
  final nomorIndukTextEditingController = TextEditingController();
  final _firebaseService = FirebaseService();
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
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      pickedFile.value = File(image.path);
      isImageSelected = true;

      update();
    }
  }

  Future<void> pickImageFromGallery() async {
    if (isImageSelected) {
      resetImageSelection();
    }
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      pickedFile.value = File(image.path);
      isImageSelected = true;

      update();
    }
  }

  Future<void> saveDataAnggota() async {
    try {
      openDialig();
      String noPensiun =
          '${digitPertama.text}-${digitKedua.text}-${digitKetiga.text}-${digitKeEmpat.text}';
      await _firebaseService.saveDataAnggota(
          namaTextEditingController.text,
          noPensiun,
          nomorIndukTextEditingController.text.trim(),
          provname,
          kabname,
          kecname,
          imageFile!.path);
      Get.back();
      Get.snackbar("Sukses", "Data keanggotaan kamu berhasil disimpan",
          backgroundColor: Colors.green[800], colorText: Colors.white);
    } catch (e) {
      Get.back();
      Get.snackbar("Error", "Gagal menyimpan data siswa");
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
}
