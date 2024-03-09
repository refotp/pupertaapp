import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:ktaapp/widgets/signup/titlefield.dart';

class RegisterKta extends StatelessWidget {
  const RegisterKta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorConst.merahOren,
                        borderRadius: BorderRadius.circular(24)),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Daftar Keanggotaan',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                          Text(
                            'Silahkan lengkapi form dibawah ini',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: -30,
                    top: -20,
                    width: 160,
                    height: 160,
                    child: Image.asset(
                        'assets/registerkta/header_image_register_kta_merah.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleField(title: 'Nama lengkap'),
                    TextFormField(
                      validator: (value) =>
                          Validator.validateEmptyText('Nama Lengkap', value),
                      keyboardType: TextInputType.name,
                      cursorColor: ColorConst.merahMuda,
                      cursorOpacityAnimates: true,
                      decoration: textFieldDecoration('Nama Lengkap anda'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Nomor pensiun pertamina'),
                    TextFormField(
                      validator: (value) =>
                          Validator.validateEmptyText('Nomor pensiun', value),
                      keyboardType: TextInputType.number,
                      cursorColor: ColorConst.merahMuda,
                      cursorOpacityAnimates: true,
                      decoration: textFieldDecoration('Nomor pensiun anda'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Nomor Induk Kependudukan (NIK)'),
                    TextFormField(
                      validator: (value) => Validator.validateEmptyText(
                          'Nomor Induk Kependudukan anda', value),
                      keyboardType: TextInputType.number,
                      cursorColor: ColorConst.merahMuda,
                      cursorOpacityAnimates: true,
                      decoration:
                          textFieldDecoration('Nomor induk kependudukan anda'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Domisili'),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        start: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (a) {},
                              children: [
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(29, 196, 77, 26),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.abuTua.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.abuTua.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Kota/Kabupaten'),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        start: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (a) {},
                              children: [
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(29, 196, 77, 26),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.abuTua.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.abuTua.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Kecamatan'),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadiusDirectional.horizontal(
                                        start: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (a) {},
                              children: [
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                                Center(child: Text('data')),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(29, 196, 77, 26),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.abuTua.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.abuTua.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
