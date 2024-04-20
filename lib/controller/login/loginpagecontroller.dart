import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/googlesignupsignin/googleregscreen.dart';
import 'package:ktaapp/screens/transition/successloginscreen.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  RxBool isHidden = true.obs;

  Future<void> login() async {
    try {
      if (!formState.currentState!.validate()) {
        return;
      } else {
        openDialog();
        await AuthenticationRepository.instance
            .login(emailController.text, passwordController.text);
        onLoginSuccess();
      }
    } catch (e) {
      Get.back();
      print(e);
      if (e is AuthException) {
        switch (e.statusCode) {
          case '400':
            Get.snackbar('', '',
                duration: const Duration(seconds: 3),
                snackPosition: SnackPosition.TOP,
                icon: const Icon(
                  Icons.warning_rounded,
                  color: Colors.white,
                ),
                backgroundColor: Colors.red,
                colorText: Colors.white,
                titleText: const Text(
                  'Error',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                messageText: const Text(
                  'Periksa kembali email atau password anda',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ));
            break;
          default:
            Get.snackbar('Error', e.message);
        }
        // Menangani kesalahan autentikasi, misalnya email atau password salah
      } else {
        rethrow;
      }
    }
  }
}

void googleSignIn() async {
  try {
    final authRepo = Get.put(AuthenticationRepository());
    bukaDialog();
    await authRepo.googleSignIn();
    checkUser();
  } catch (e) {
    Get.back();
    throw 'Error : $e';
  }
}

void openDialog() {
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

bukaDialog() {
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

void checkUser() async {
  final userEmail = SupBase.supabase.auth.currentUser!.email;
  final response = await SupBase.supabase
      .from('user_data')
      .select('email')
      .eq('email', userEmail!);
  if (response.isEmpty) {
    Get.to(() => const GoogleRegScreen());
  } else {
    AuthenticationRepository.instance.pindahHalaman();
  }
}

void onLoginSuccess() {
  Get.off(() => const SuccessLoginScreen());
  Future.delayed(const Duration(seconds: 5), () {
    final homePage = HomePageController();
    homePage.onInit();
    AuthenticationRepository.instance.pindahHalaman();
  });
}
