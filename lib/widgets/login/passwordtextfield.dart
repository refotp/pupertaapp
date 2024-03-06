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
              constraints: BoxConstraints(maxHeight: 100.h),
              labelText: 'kepitingBerkEpalaRusa123',
              labelStyle: TextStyle(color: ColorConst.abu.withOpacity(0.5)),
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
                borderSide: const BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: controller.isHidden.value
                  ? const Icon(
                      Ionicons.lock_closed,
                      color: ColorConst.abu,
                    )
                  : const Icon(
                      Ionicons.lock_open,
                      color: ColorConst.abu,
                    ),
              suffixIcon: Obx(
                () => IconButton(
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
