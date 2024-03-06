import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/controller/onboarding/onboardingcontroller.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key, required this.controller});

  final OnBoardingController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [controller.skipVisibility()],
      ),
    );
  }
}
