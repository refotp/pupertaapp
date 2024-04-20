import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/screens/login/loginpage.dart';
import 'package:ktaapp/widgets/common/footer.dart';
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
                        cursorColor: ColorConst.tersier,
                        style: const TextStyle(
                            color: ColorConst.tersier,
                            fontWeight: FontWeight.w400),
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
                        cursorColor: ColorConst.tersier,
                        decoration: textFieldDecoration('08XXXXXXXXXX'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Status'),
                      DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none),
                            filled: true,
                            fillColor: ColorConst.sekunder.withOpacity(0.25),
                            contentPadding: const EdgeInsets.only(
                                top: 16, left: 10, bottom: 16),
                            prefix: const Icon(
                              Icons.admin_panel_settings,
                              color: ColorConst.abu,
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: 'Anggota',
                              child: Text('Anggota'),
                            ),
                            DropdownMenuItem(
                              value: 'Pengurus',
                              child: Text('Pengurus'),
                            ),
                          ],
                          style: const TextStyle(color: ColorConst.tersier),
                          onChanged: (onChanged) {
                            controller.role.value = onChanged!;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Password e-KTA'),
                      PassTextField(
                        controller: controller,
                        label: 'kuD4LauTbeRkepAlaB4d4K12',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Konfirmasi Password e-KTA'),
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
                        color: ColorConst.primer),
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
                ),
                // Footer(tekan: controller.googleSignIn)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
