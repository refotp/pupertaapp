import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ionicons/ionicons.dart';
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
                        color: ColorConst.primer,
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
                        'assets/registerkta/header_image_register_kta.png'),
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
                      cursorColor: ColorConst.sekunder,
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
                      cursorColor: ColorConst.sekunder,
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
                      cursorColor: ColorConst.sekunder,
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
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
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
                          color: ColorConst.sekunder.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.tersier.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.tersier.withOpacity(0.5),
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
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
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
                          color: ColorConst.sekunder.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.abu.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.tersier.withOpacity(0.5),
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
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
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
                          color: ColorConst.sekunder.withOpacity(0.2),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: TextFieldTapRegion(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Provinsi',
                                style: TextStyle(
                                    color: ColorConst.abu.withOpacity(0.5),
                                    fontSize: 16),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: ColorConst.tersier.withOpacity(0.5),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Unggah foto anda'),
                    Center(
                      child: Container(
                        width: 160,
                        height: 160,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/registerkta/avatar-1577909_1280.png'),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 120.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConst.primer),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.camera,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Kamera',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 120.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: ColorConst.primer),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.photo_on_rectangle,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Galeri',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  foregroundColor: Colors.transparent,
                  minimumSize: Size(double.maxFinite, 60.h),
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: ColorConst.primer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16.spMin),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
