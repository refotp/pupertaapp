import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/screens/otp/otpscreen.dart';
import 'package:ktaapp/screens/transition/successregistraionscreen.dart';
import 'package:ktaapp/services/authenticationrepository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final phoneTextEditingController = TextEditingController();
  final confirmPassTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final initEmailValue = AuthenticationRepository.instance.authUser?.email;
  final isRegistered = false.obs;

  RxString role = ''.obs;
  RxBool isVisible = true.obs;
  RxBool isHidden = true.obs;
  GlobalKey<FormState> stateForm = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      // print(passwordTextEditingController.text);
      // print(confirmPassTextEditingController.text);
      if (!stateForm.currentState!.validate()) {
        return;
      } else {
        openDialog();
        if (role.value == 'Pengurus') {
          Get.offAll(() => VerifAdmin(
                email: emailTextEditingController.text,
                noTelp: phoneTextEditingController.text,
                peran: role.value,
                password: passwordTextEditingController.text,
              ));
        } else {
          await AuthenticationRepository.instance.signUp(
              emailTextEditingController.text,
              passwordTextEditingController.text);
          addUserData(emailTextEditingController.text,
              phoneTextEditingController.text, role.value);
          onRegistrationSuccess();
        }
      }
    } catch (e) {
      Get.back();
      print('aawkleoakweoakwoeakoewake');
      throw 'Error : $e';
    }
  }

  Future<void> signUpGoogle() async {
    try {
      // if (!stateForm.currentState!.validate()) {
      //   return;
      // } else {
      openDialog();
      if (role.value == 'Pengurus') {
        Get.offAll(() => VerifAdmin(
              email: initEmailValue!,
              noTelp: phoneTextEditingController.text,
              peran: role.value,
              password: passwordTextEditingController.text,
            ));
      } else {
        addUserData(
            initEmailValue!, phoneTextEditingController.text, role.value);
        onRegistrationSuccess();
      }
    } catch (e) {
      Get.back();
      throw 'Error : $e';
    }
  }

  void addUserData(String email, String notelp, String role) async {
    await SupBase.supabase
        .from('user_data')
        .insert({'email': email, 'notelp': notelp, 'role': role});
  }

  void googleSignIn() async {
    try {
      final authRepo = Get.put(AuthenticationRepository());
      await authRepo.googleSignIn();
    } catch (e) {
      throw 'Error : $e';
    } finally {
      onRegistrationSuccess();
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
