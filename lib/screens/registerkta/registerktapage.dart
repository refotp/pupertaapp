import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/registerkta/registerktacontroller.dart';
import 'package:ktaapp/helper/validator.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:ktaapp/widgets/registerkta/nomorpensiun.dart';
import 'package:ktaapp/widgets/signup/titlefield.dart';

class RegisterKta extends StatelessWidget {
  const RegisterKta({super.key, required this.role});
  final String role;
  @override
  Widget build(BuildContext context) {
    final controller = RegisterKtaController();
    controller.onInit();
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
                key: controller.stateForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleField(title: 'Nama lengkap'),
                    TextFormField(
                      validator: (value) =>
                          Validator.validateEmptyText('Nama Lengkap', value),
                      keyboardType: TextInputType.name,
                      controller: controller.namaTextEditingController,
                      cursorColor: ColorConst.sekunder,
                      cursorOpacityAnimates: true,
                      decoration: textFieldDecoration('Nama Lengkap anda'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Nomor pensiun pertamina'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        NomorPensiun(
                          isSix: false,
                          controller: controller.digitPertama,
                          maxLength: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: const Text(
                            '-',
                            style: TextStyle(
                                color: ColorConst.tersier,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        NomorPensiun(
                          isSix: false,
                          controller: controller.digitKedua,
                          maxLength: 2,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: const Text(
                            '-',
                            style: TextStyle(
                                color: ColorConst.tersier,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        NomorPensiun(
                          isSix: true,
                          controller: controller.digitKetiga,
                          maxLength: 6,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          child: const Text(
                            '-',
                            style: TextStyle(
                                color: ColorConst.tersier,
                                fontSize: 16,
                                fontWeight: FontWeight.w900),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        NomorPensiun(
                          isSix: false,
                          controller: controller.digitKeEmpat,
                          maxLength: 2,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Nomor Induk Kependudukan (NIK)'),
                    TextFormField(
                      validator: (value) => Validator.validateEmptyText(
                          'Nomor Induk Kependudukan anda', value),
                      keyboardType: TextInputType.number,
                      controller: controller.nomorIndukTextEditingController,
                      cursorColor: ColorConst.sekunder,
                      cursorOpacityAnimates: true,
                      decoration:
                          textFieldDecoration('Nomor induk kependudukan anda'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Domisili Provinsi'),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (provinsi) {
                                controller.provinsi.value =
                                    controller.daftarProvinsi[provinsi]['name'];
                                controller.fetchKabupaten(
                                    controller.daftarProvinsi[provinsi]['id']);
                              },
                              children: controller.daftarProvinsi
                                  .map((element) => Center(
                                        child: Text(element["name"]),
                                      ))
                                  .toList(),
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
                              Obx(
                                () => Text(
                                  controller.provname,
                                  style: const TextStyle(
                                      color: ColorConst.tersier, fontSize: 16),
                                ),
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
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (kabupaten) {
                                controller.kabupaten.value = controller
                                    .daftarKabupaten[kabupaten]['name'];
                                controller.fetchKecamatan(controller
                                    .daftarKabupaten[kabupaten]['id']);
                              },
                              children: controller.daftarKabupaten
                                  .map((element) => Center(
                                        child: Text(element['name']),
                                      ))
                                  .toList(),
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
                              Obx(
                                () => Text(
                                  controller.kabname,
                                  style: const TextStyle(
                                      color: ColorConst.tersier, fontSize: 16),
                                ),
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
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadiusDirectional.vertical(
                                    top: Radius.circular(24))),
                            width: double.infinity,
                            height: 300,
                            child: CupertinoPicker(
                              itemExtent: 64,
                              onSelectedItemChanged: (kecamatan) {
                                controller.kecamatan.value = controller
                                    .daftarKecamatan[kecamatan]['name'];
                              },
                              children: controller.daftarKecamatan
                                  .map((element) => Center(
                                        child: Text(element['name']),
                                      ))
                                  .toList(),
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
                              Obx(() => Text(
                                    controller.kecname,
                                    style: const TextStyle(
                                        color: ColorConst.tersier,
                                        fontSize: 16),
                                  )),
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
                    TextFormField(
                      enabled: false,
                      keyboardType: TextInputType.phone,
                      initialValue: role,
                      cursorColor: const Color.fromARGB(255, 18, 18, 20),
                      decoration: textFieldDecoration(role),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TitleField(title: 'Unggah foto anda'),
                    Center(
                      child: SizedBox(
                        width: 160,
                        height: 160,
                        child: Obx(
                          () => controller.pickedFile.value == null
                              ? Image.asset(
                                  'assets/registerkta/avatar-1577909_1280.png',
                                )
                              : Image.file(
                                  File(controller.imageFile!.path),
                                  fit: BoxFit.fitWidth,
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
                          onTap: () {
                            controller.captureImageFromCamera();
                          },
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
                          onTap: () {
                            controller.pickImageFromGallery();
                          },
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
                onPressed: () {
                  controller.saveDataAnggota(role: role);
                },
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
