import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ktaapp/screens/login/loginpage.dart';
import 'package:ktaapp/widgets/onboarding/navigatetologin.dart';
import 'package:ktaapp/widgets/onboarding/nextbutton.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  void onPageChanged(index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value == 2) {
      // final storage = GetStorage();
      // storage.write('isFirstTime', false);
      Get.offAll(() => const LoginPage());
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
    }
  }

  buttonChanged() {
    if (currentIndex.value == 2) {
      return const NavigateToLogin();
    } else {
      return const NextButton();
    }
  }

  Widget skipVisibility() {
    if (currentIndex.value < 2) {
      return InkWell(
        onTap: () {
          skipPage();
        },
        child: Text(
          'Skip',
          style: TextStyle(
              fontSize: 18.spMin,
              fontWeight: FontWeight.w600,
              color: Colors.red),
        ),
      );
    } else {
      return Container();
    }
  }

  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void skipPage() {
    pageController.jumpToPage(3);
  }
}
