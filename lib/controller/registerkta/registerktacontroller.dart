import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktaapp/services/apiwilayahservice.dart';

class RegisterKtaController extends GetxController {
  static RegisterKtaController get instance => Get.find();

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

  void resetImageSelection() {
    pickedFile.value = null;
    isImageSelected = false;
    update();
  }
}
