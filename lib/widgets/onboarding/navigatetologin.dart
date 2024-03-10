import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';

class NavigateToLogin extends StatelessWidget {
  const NavigateToLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 60.h,
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 12, right: 12),
      decoration: const BoxDecoration(
        color: ColorConst.primer,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Login',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.spMin,
                fontWeight: FontWeight.w600),
          ),
          const Icon(
            Ionicons.log_in,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
