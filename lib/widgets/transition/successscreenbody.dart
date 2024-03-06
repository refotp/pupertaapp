import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SuccessScreenBody extends StatelessWidget {
  final String img, title, subtitle;
  const SuccessScreenBody({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Lottie.asset(img, width: 300.w, height: 300.h),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 18.spMin, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.black54, fontSize: 16.spMin),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
