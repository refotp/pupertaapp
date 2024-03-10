import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/helper/validator.dart';

class PassTextField extends StatelessWidget {
  final String label;
  const PassTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        validator: (value) => Validator.validateEmptyText('Password', value),
        obscureText: controller.isVisible.value,
        controller: controller.passwordTextEditingController,
        cursorColor: Colors.amber[600],
        decoration: InputDecoration(
          constraints: BoxConstraints(maxHeight: 100.h),
          labelText: label,
          labelStyle: TextStyle(
            color: ColorConst.abu.withOpacity(0.5),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black26),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.red),
          ),
          contentPadding: const EdgeInsets.only(
            top: 20,
            left: 16,
            bottom: 20,
          ),
          prefixIcon: const Icon(
            Ionicons.lock_closed,
            color: ColorConst.abu,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              controller.isVisible.value = !controller.isVisible.value;
            },
            icon: controller.isVisible.value
                ? const Icon(
                    Ionicons.eye_off,
                    color: ColorConst.sekunder,
                  )
                : const Icon(
                    Ionicons.eye,
                    color: ColorConst.sekunder,
                  ),
          ),
        ),
      ),
    );
  }
}
