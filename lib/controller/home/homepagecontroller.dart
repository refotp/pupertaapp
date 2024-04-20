import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
// import 'package:pdf/pdf.dart' as pw;
// import 'package:open_filex/open_filex.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  final zoomDrawerController = ZoomDrawerController();
  final RxInt currentIndex = 0.obs;
  RxBool isVisible = true.obs;
  RxBool isPengurus = false.obs;
  RxBool isSuper = false.obs;
  RxBool isKetua = false.obs;
  RxString _role = ''.obs;
  String get role => _role.value;
  RxList anggotaList = [].obs;
  RxBool isLoading = true.obs;
  PageController pageController = PageController(viewportFraction: 0.9);
  void onPageChanged(index) {
    currentIndex.value = index;
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }

  @override
  void onInit() {
    hideMenu();
    super.onInit();
  }

  Future<String> getUserRole() async {
    final authRepo = Get.put(AuthenticationRepository());
    final response = await SupBase.supabase
        .from('user_data')
        .select('role')
        .eq('email', '${authRepo.authUser!.email}');
    return response[0].values.first;
  }

  Future<bool> hideMenu() async {
    _role.value = await getUserRole();
    print(role);
    if (role == 'Pengurus') {
      return isPengurus.value = !isPengurus.value;
    } else if (role == 'Super Admin') {
      return isSuper.value = !isSuper.value;
    } else if (role == 'Ketua') {
      return isKetua.value = !isKetua.value;
    } else {
      return isPengurus.value = isPengurus.value;
    }
  }

  getAnggota() async {
    final authRepo = Get.put(AuthenticationRepository());
    final userId = authRepo.authUser?.id;
    try {
      return SupBase.supabase
          .from('data_anggota')
          .select()
          .eq('user_id', userId!);
    } catch (e) {
      throw 'Error : $e';
    }
  }
}
