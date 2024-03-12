import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ktaapp/screens/home/homepage.dart';
import 'package:ktaapp/screens/navigation/navigation.dart';
import 'package:ktaapp/screens/transition/successloginscreen.dart';
import 'package:ktaapp/screens/transition/successregistraionscreen.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();
  RxString pin1 = ''.obs;
  RxString pin2 = ''.obs;
  RxString pin3 = ''.obs;
  RxString pin4 = ''.obs;

  void verify() {
    bukaDialog();
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => const SuccessRegistraionScreen());
    });
    Future.delayed(const Duration(seconds: 8), () {
      Get.offAll(() => const NavigationPage());
    });
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
