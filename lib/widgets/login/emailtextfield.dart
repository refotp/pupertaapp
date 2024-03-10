import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/login/loginpagecontroller.dart';
import 'package:ktaapp/helper/validator.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Email",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.spMin),
      ),
      const SizedBox(
        height: 16,
      ),
      TextFormField(
        validator: (value) => Validator.validateEmptyText('Email', value),
        controller: controller.emailController,
        cursorColor: ColorConst.tersier,
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorConst.sekunder.withOpacity(0.25),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(12),
          ),
          constraints: BoxConstraints(maxHeight: 100.h),
          labelStyle: TextStyle(color: ColorConst.abu.withOpacity(0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(style: BorderStyle.none),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(style: BorderStyle.none),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(style: BorderStyle.none),
              borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.only(
            top: 20,
            left: 16,
            bottom: 20,
          ),
        ),
      ),
    ]);
  }
}
