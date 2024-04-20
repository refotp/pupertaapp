import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title, subtitle;
  const Header({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: SizedBox(
            height: 100.h,
            child: Image.asset(
              "assets/login_signup/Untitled-1.png",
              width: 240.w,
              height: 240.h,
            ),
          ),
        ),
        const SizedBox(
          height: 28,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.spMin),
        ),
        const SizedBox(
          height: 14,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16.spMin, color: Colors.black54),
        ),
      ],
    );
  }
}
