import 'package:flutter/material.dart';
import 'package:ktaapp/widgets/transition/successscreenbody.dart';

class SuccessRegistraionScreen extends StatelessWidget {
  const SuccessRegistraionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuccessScreenBody(
          img: 'assets/login_signup/Animation - 1704518013841 (1).json',
          title: 'Berhasil',
          subtitle:
              'Selamat akun anda berhasil dibuat. Tunggu sebentar yaa kami sedang bersiap - siap.'),
    );
  }
}
