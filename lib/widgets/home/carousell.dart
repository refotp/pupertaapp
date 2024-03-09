import 'package:flutter/material.dart';
import 'package:ktaapp/constants/stringconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';

class Carousell extends StatelessWidget {
  const Carousell({
    super.key,
    required this.controller,
  });

  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: 200,
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        itemCount: StringConst.imageCarousel.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(StringConst.imageCarousel[index]),
                  fit: BoxFit.fill),
            ),
            padding: const EdgeInsets.all(12.0),
          );
        },
      ),
    );
  }
}
