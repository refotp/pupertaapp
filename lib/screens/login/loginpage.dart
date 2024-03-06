import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ktaapp/controller/login/loginpagecontroller.dart';
import 'package:ktaapp/screens/signup/signuppage.dart';
import 'package:ktaapp/widgets/login/emailtextfield.dart';
import 'package:ktaapp/widgets/common/header.dart';
import 'package:ktaapp/widgets/login/passwordtextfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(
                  title: 'Login',
                  subtitle:
                      'Silahkan masukan identitas sesuai dengan data yang sudah di daftarkan',
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: controller.formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailTextField(controller: controller),
                      const SizedBox(
                        height: 20,
                      ),
                      PasswordTextField(controller: controller),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GestureDetector(
                      child: const Text(
                        'Lupa password ?',
                        style: TextStyle(color: Colors.blue, fontSize: 16),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize: Size(double.maxFinite, 60.h),
                    surfaceTintColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 196, 77, 26),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    controller.login();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 16.spMin),
                  ),
                ),
                const SizedBox(height: 32),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Belum punya akun? ',
                      style:
                          TextStyle(fontSize: 16.spMin, color: Colors.black38),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Registrasi',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(() => const SignUpPage());
                            },
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
