import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.w,
      decoration: const BoxDecoration(
        color: ColorConst.primer,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: const Icon(
        Ionicons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
}
