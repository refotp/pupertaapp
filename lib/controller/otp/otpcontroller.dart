import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/screens/transition/successregistraionscreen.dart';
import 'package:ktaapp/services/authenticationrepository.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  TextEditingController pinSat = TextEditingController();
  TextEditingController pinDua = TextEditingController();
  TextEditingController pinTiga = TextEditingController();
  TextEditingController pinEmpat = TextEditingController();

  void verify(
      String email, String noTelp, String peran, String password) async {
    bukaDialog();
    String pins = '${pinSat.text}${pinDua.text}${pinTiga.text}${pinEmpat.text}';
    const correctPin = AdminKey.pin;
    try {
      if (pins == correctPin) {
        final signUp = Get.put(SignUpController());
        await AuthenticationRepository.instance.signUp(email, password);
        signUp.addUserData(email, noTelp, peran);
        onRegistrationSuccess();
      } else {
        Get.back();
        Get.snackbar('Error', 'Pin yang anda masukan salah',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            icon: const Icon(
              Icons.warning_rounded,
              color: Colors.white,
            ));
        Future.delayed(const Duration(milliseconds: 1500), () {
          pinSat.value = TextEditingValue.empty;
          pinDua.value = TextEditingValue.empty;
          pinTiga.value = TextEditingValue.empty;
          pinEmpat.value = TextEditingValue.empty;
        });
      }
    } catch (e) {
      throw 'Error :$e';
    }
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

  void onRegistrationSuccess() {
    Get.off(() => const SuccessRegistraionScreen());
    Future.delayed(const Duration(seconds: 5), () {
      AuthenticationRepository.instance.pindahHalaman();
    });
  }
}
