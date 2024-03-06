import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/helper/validator.dart';

class ConfirmPassTextField extends StatelessWidget {
  final String label;
  const ConfirmPassTextField({
    super.key,
    required this.controller,
    required this.label,
  });

  final SignUpController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        validator: (value) => Validator.validatePassword(
            value, controller.passwordTextEditingController.text),
        obscureText: controller.isHidden.value,
        controller: controller.confirmPassTextEditingController,
        cursorColor: Colors.amber[600],
        decoration: InputDecoration(
          helperMaxLines: 2,
          helperStyle: const TextStyle(color: Colors.black),
          helperText: 'Tulis kembali password anda',
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
              controller.isHidden.value = !controller.isHidden.value;
            },
            icon: controller.isHidden.value
                ? const Icon(
                    Ionicons.eye_off,
                    color: ColorConst.merahMuda,
                  )
                : const Icon(
                    Ionicons.eye,
                    color: ColorConst.merahMuda,
                  ),
          ),
        ),
      ),
    );
  }
}
