import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/signup/signupcontroller.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/widgets/common/header.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:ktaapp/widgets/signup/titlefield.dart';

class GoogleRegScreen extends StatelessWidget {
  const GoogleRegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignUpController();
    controller.onInit();
    return Theme(
      data: ThemeData(
          dividerTheme: const DividerThemeData(color: Colors.transparent),
          fontFamily: 'Nunito'),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(
                    title: 'Lengkapi data',
                    subtitle:
                        'Lengkapi datamu untuk mempermudah pelayanan keanggotaanmu'),
                const SizedBox(
                  height: 20,
                ),
                const TitleField(title: 'Email'),
                TextFormField(
                  enabled: false,
                  validator: (value) =>
                      Validator.validateEmptyText('Email', value),
                  keyboardType: TextInputType.phone,
                  initialValue: controller.initEmailValue,
                  cursorColor: const Color.fromARGB(255, 18, 18, 20),
                  decoration: textFieldDecoration(controller.initEmailValue!),
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
                      contentPadding:
                          const EdgeInsets.only(top: 16, left: 10, bottom: 16),
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
              ],
            ),
          ),
        ),
        persistentFooterButtons: [
          GestureDetector(
            onTap: () {
              controller.signUpGoogle();
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
        ],
      ),
    );
  }
}
