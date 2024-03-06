import 'package:flutter/material.dart';
import 'package:ktaapp/widgets/transition/successscreenbody.dart';

class SuccessLoginScreen extends StatelessWidget {
  const SuccessLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SuccessScreenBody(
          img: 'assets/login_signup/Animation - 1704531583586 (2).json',
          title: 'Selamat datang kembali',
          subtitle:
              'Kami sedang mengalihkan anda ke halaman utama. nikmatilah layanan yang telah kami sediakan'),
    );
  }
}
