import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/login/loginpagecontroller.dart';
import 'package:ktaapp/helper/validator.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18.spMin),
        ),
        const SizedBox(
          height: 16,
        ),
        Obx(
          () => TextFormField(
            controller: controller.passwordController,
            validator: (value) =>
                Validator.validateEmptyText('Password', value),
            cursorColor: Colors.amber[600],
            obscureText: controller.isHidden.value,
            decoration: InputDecoration(
              filled: true,
              fillColor: ColorConst.sekunder.withOpacity(0.25),
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
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(12),
              ),
              suffixIcon: Obx(
                () => IconButton(
                  onPressed: () {
                    controller.isHidden.value = !controller.isHidden.value;
                  },
                  icon: controller.isHidden.value
                      ? const Icon(
                          Ionicons.eye_off,
                          color: ColorConst.tersier,
                        )
                      : const Icon(
                          Ionicons.eye,
                          color: ColorConst.tersier,
                        ),
                ),
              ),
              contentPadding: const EdgeInsets.only(
                top: 20,
                left: 16,
                bottom: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}
