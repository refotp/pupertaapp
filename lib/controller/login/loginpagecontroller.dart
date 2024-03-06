import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/screens/home/homepage.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/screens/transition/successloginscreen.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  RxBool isHidden = true.obs;

  // Future<void> login() async {
  // try {
  //   if (!formState.currentState!.validate()) {
  //     return;
  //   } else {
  //     openDialog();
  //     await AuthenticationRepository.instance.loginWithEmailAndPassword(
  //         emailController.text, passwordController.text);
  //     onLoginSuccess();
  //   }
  // } on FirebaseAuthException catch (e) {
  //   Get.back();
  //   switch (e.code) {
  //     case 'invalid-credential':
  //       AuthErrorHandling.invalidCredential();
  //       break;
  //     case 'too-many-requests':
  //       AuthErrorHandling.tooManyRequest();
  //       break;
  //     case 'invalid-email':
  //       AuthErrorHandling.invalidEmail();
  //       break;
  //   }
  // }
  // }
  void login() {
    if (!formState.currentState!.validate()) {
      return;
    } else {
      bukaDialog();
      Future.delayed(const Duration(seconds: 3), () {
        onLoginSuccess();
      });
    }

    // ;
  }

  // void openDialog() {
  //   Get.dialog(
  //       Dialog(
  //         backgroundColor: Colors.blue,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //         child: const SizedBox(
  //           width: 100,
  //           height: 150,
  //           child: SpinKitCubeGrid(
  //             size: 100,
  //             color: Colors.white,
  //           ),
  //         ),
  //       ),
  //       barrierDismissible: false);

  // }
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
}

void onLoginSuccess() {
  Get.off(() => const SuccessLoginScreen());

  // Menunda kembali ke halaman sebelumnya setelah 3 detik (sesuaikan dengan kebutuhan Anda)
  Future.delayed(const Duration(seconds: 5), () {
    // AuthenticationRepository.instance.pindahHalaman();
    Get.offAll(() => const NavigationPage()); // Pergi ke halaman baru
  });
}
