import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/screens/login/loginpage.dart';
import 'package:ktaapp/widgets/common/header.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:ktaapp/widgets/signup/confirmtpasstextfield.dart';
import 'package:ktaapp/widgets/signup/passtextfield.dart';
import 'package:ktaapp/widgets/signup/titlefield.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(
                    title: 'Registration',
                    subtitle: 'Ayo daftarkan data dirimu terlebih dahulu'),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: controller.stateForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleField(title: 'Email'),
                      TextFormField(
                        validator: (value) =>
                            Validator.validateEmptyText('Email', value),
                        keyboardType: TextInputType.name,
                        controller: controller.emailTextEditingController,
                        cursorColor: Colors.amber[600],
                        decoration: textFieldDecoration('praktikno@gmail.com'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Nomor HP'),
                      TextFormField(
                        validator: (value) =>
                            Validator.validateEmptyText('Nomor HP', value),
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneTextEditingController,
                        cursorColor: Colors.amber[600],
                        decoration: textFieldDecoration('08XXXXXXXXXX'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Password'),
                      PassTextField(
                        controller: controller,
                        label: 'kuD4LauTbeRkepAlaB4d4K12',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Konfirmasi Password'),
                      ConfirmPassTextField(
                        controller: controller,
                        label: 'kuD4LauTbeRkepAlaB4d4K12',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    controller.signUp();
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorConst.merahOren),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontSize: 16.spMin),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Center(
                    child: RichText(
                      text: TextSpan(
                        text: 'Sudah punya akun? ',
                        style: TextStyle(
                            fontSize: 16.spMin, color: Colors.black38),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Login',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(() => const LoginPage());
                              },
                            style: TextStyle(
                              color: Colors.blue[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
