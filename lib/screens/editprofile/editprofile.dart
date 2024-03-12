import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:ktaapp/widgets/signup/titlefield.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerTheme: const DividerThemeData(
          color: Colors.transparent,
        ),
      ),
      child: Scaffold(
        persistentFooterButtons: [
          InkWell(
            onTap: () {},
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ColorConst.primer,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          centerTitle: true,
          backgroundColor: ColorConst.primer,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: ColorConst.primer,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const CircleAvatar(
                              radius: 80,
                              backgroundImage:
                                  AssetImage('assets/profile/profil_1.png'),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 10,
                              child: Icon(
                                CupertinoIcons.add_circled_solid,
                                color: Colors.grey[900],
                                size: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TitleField(title: 'Nama Lengkap'),
                      TextFormField(
                        initialValue: 'Refo Tri Putra',
                        validator: (value) =>
                            Validator.validateEmptyText('Nama Lengkap', value),
                        keyboardType: TextInputType.name,
                        cursorColor: ColorConst.tersier,
                        cursorOpacityAnimates: true,
                        style: const TextStyle(
                            color: ColorConst.tersier,
                            fontWeight: FontWeight.w600),
                        decoration: textFieldDecoration('Nama Lengkap anda'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'Email'),
                      TextFormField(
                        initialValue: 'refotri2001@gmail.com',
                        enabled: false,
                        keyboardType: TextInputType.number,
                        cursorColor: ColorConst.tersier,
                        cursorOpacityAnimates: true,
                        style: TextStyle(
                            color: ColorConst.tersier.withOpacity(0.25),
                            fontWeight: FontWeight.w600),
                        decoration: textFieldDecoration(''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TitleField(title: 'No Telefon'),
                      TextFormField(
                        initialValue: '085869548854',
                        validator: (value) =>
                            Validator.validateEmptyText('Nama Lengkap', value),
                        keyboardType: TextInputType.name,
                        cursorColor: ColorConst.tersier,
                        cursorOpacityAnimates: true,
                        style: const TextStyle(
                            color: ColorConst.tersier,
                            fontWeight: FontWeight.w600),
                        decoration: textFieldDecoration(''),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
