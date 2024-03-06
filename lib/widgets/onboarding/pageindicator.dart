import 'package:flutter/material.dart';
import 'package:ktaapp/controller/onboarding/onboardingcontroller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.controller,
  });

  final OnBoardingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SmoothPageIndicator(
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
        effect: const ExpandingDotsEffect(
            activeDotColor: Colors.red,
            dotColor: Colors.black,
            dotWidth: 24,
            dotHeight: 6),
      ),
    );
  }
}
