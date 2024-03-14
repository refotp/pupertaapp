import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/helper/firebaseerror.dart';
import 'package:ktaapp/model/usermodel.dart';
import 'package:ktaapp/screens/transition/successregistraionscreen.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:ktaapp/services/userservice.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final phoneTextEditingController = TextEditingController();
  final confirmPassTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  RxBool isVisible = true.obs;
  RxBool isHidden = true.obs;
  GlobalKey<FormState> stateForm = GlobalKey();

  // void signUp() {
  //   try {
  //     if (!stateForm.currentState!.validate()) {
  //       return;
  //     }
  //     openDialog();
  //     Future.delayed(const Duration(seconds: 3));
  //     Get.to(() => const );
  //   } catch (e) {}
  // }
  Future<void> signUp() async {
    try {
      if (!stateForm.currentState!.validate()) {
        return;
      } else {
        openDialog();
        final userCredential = await AuthenticationRepository.instance
            .registerWithEmailAndPassword(
                emailTextEditingController.text.trim(),
                passwordTextEditingController.text);
        final newUser = UserModel(
            id: userCredential.user!.uid,
            name: '',
            email: emailTextEditingController.text,
            phoneNumber: phoneTextEditingController.text);
        final userRepository = Get.put(UserService());
        await userRepository.saveUserData(newUser);
        onRegistrationSuccess();
      }
    } on FirebaseAuthException catch (e) {
      Get.back();
      switch (e.code) {
        case 'invalid-email':
          FirebaseAuthErrorHandling.invalidEmail();
          break;
        case 'invalid-password':
          FirebaseAuthErrorHandling.invalidPassword();
          break;
        case 'email-already-exists':
          FirebaseAuthErrorHandling.emailAlreadyExists();
          break;
        case 'phone-number-already-exists':
          FirebaseAuthErrorHandling.phoneNumberAlreadyExists();
          break;
      }
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

  void onRegistrationSuccess() {
    Get.off(() => const SuccessRegistraionScreen());

    Future.delayed(const Duration(seconds: 5), () {
      AuthenticationRepository.instance.pindahHalaman();
    });
  }
}
