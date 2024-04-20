import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/otp/otpcontroller.dart';

class VerifAdmin extends StatelessWidget {
  const VerifAdmin(
      {super.key,
      required this.email,
      required this.noTelp,
      required this.peran,
      required this.password});
  final String email, noTelp, peran, password;

  @override
  Widget build(BuildContext context) {
    final controller = OtpController();
    return Theme(
      data: ThemeData(
          dividerTheme: const DividerThemeData(color: Colors.transparent)),
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
        backgroundColor: const Color.fromARGB(255, 13, 13, 22),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/login_signup/header halaman otp_2.png',
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Verifikasi Admin',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      'Masukan kode admin',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          controller: controller.pinSat,
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller.pinSat.value =
                                  TextEditingValue(text: value);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorConst.sekunder,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: ColorConst.sekunder, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          controller: controller.pinDua,
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller.pinDua.value =
                                  TextEditingValue(text: value);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorConst.sekunder,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: ColorConst.sekunder, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          controller: controller.pinTiga,
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller.pinTiga.value =
                                  TextEditingValue(text: value);
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          cursorColor: ColorConst.sekunder,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: ColorConst.sekunder, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 68,
                        height: 64,
                        child: TextFormField(
                          controller: controller.pinEmpat,
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller.pinEmpat.value =
                                  TextEditingValue(text: value);
                              controller.verify(email, noTelp, peran, password);
                            }
                          },
                          cursorColor: ColorConst.sekunder,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: ColorConst.sekunder, width: 2)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.white, width: 2)),
                              contentPadding: const EdgeInsets.all(8),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 32),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
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
