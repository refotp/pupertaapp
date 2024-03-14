import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/helper/firebaseerror.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/screens/transition/successloginscreen.dart';
import 'package:ktaapp/services/authenticationrepository.dart';

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
            .logIn(emailController.text, passwordController.text);
        onLoginSuccess();
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      switch (e.code) {
        case 'invalid-credential':
          FirebaseAuthErrorHandling.invalidCredential();
          break;
        case 'too-many-requests':
          FirebaseAuthErrorHandling.tooManyRequest();
          break;
        case 'invalid-email':
          FirebaseAuthErrorHandling.invalidEmail();
          break;
      }
    }
  }
  // void login() {
  //   if (!formState.currentState!.validate()) {
  //     return;
  //   } else {
  //     bukaDialog();
  //     Future.delayed(const Duration(seconds: 3), () {
  //       onLoginSuccess();
  //     });
  //   }

  //   // ;
  // }

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
}

void onLoginSuccess() {
  Get.off(() => const SuccessLoginScreen());
  Future.delayed(const Duration(seconds: 5), () {
    Get.offAll(() => const NavigationPage());
  });
}
