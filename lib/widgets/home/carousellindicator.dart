import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselIndicator extends StatelessWidget {
  const CarouselIndicator({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        effect: const ExpandingDotsEffect(
            activeDotColor: ColorConst.merahMuda,
            dotHeight: 5,
            dotColor: ColorConst.abu),
      ),
    );
  }
}
