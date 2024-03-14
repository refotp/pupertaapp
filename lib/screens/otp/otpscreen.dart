import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/otp/otpcontroller.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

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
                const Text(
                  'Verifikasi OTP',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text.rich(
                    TextSpan(
                        text: 'Masukan kode yang dikirim ke ',
                        style: TextStyle(
                            color: Colors.white.withOpacity(0.85),
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                        children: const [
                          TextSpan(
                              text: '+62 85869548854',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))
                        ]),
                  ),
                ),
                const Text(
                  'Periksa sms anda',
                  style: TextStyle(color: Colors.white70),
                ),
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
                          onSaved: (pin) {
                            controller.pin4.value = pin!;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
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
                          onSaved: (pin) {
                            controller.pin4.value = pin!;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
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
                          onSaved: (pin) {
                            controller.pin4.value = pin!;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
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
                          onSaved: (pin) {
                            controller.pin4.value = pin!;
                          },
                          onChanged: (value) {
                            if (value.length == 1) {
                              controller.verify();
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
