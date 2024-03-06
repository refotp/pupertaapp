import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent(
      {super.key,
      required this.img,
      required this.title,
      required this.subTitle});
  final String img, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Container(
              child: Lottie.asset(img, width: 400.w, height: 400.w),
            ),
            SizedBox(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.spMin,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              child: Text(
                subTitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.spMin),
              ),
            )
          ],
        ),
      ),
    );
  }
}
