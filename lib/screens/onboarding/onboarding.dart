import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/controller/onboarding/onboardingcontroller.dart';
import 'package:ktaapp/screens/onboarding/onboardingcontent.dart';
import 'package:ktaapp/widgets/onboarding/pageindicator.dart';
import 'package:ktaapp/widgets/onboarding/skipbutton.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SkipButton(controller: controller),
            ),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: const [
                  OnBoardingContent(
                      img: 'assets/onboarding/Animation - 1709457231011.json',
                      title: 'Selamat datang',
                      subTitle:
                          'Halo kawan pensiunan pertamina, selamat datang di Puperta !'),
                  OnBoardingContent(
                      img: 'assets/onboarding/Animation - 1709467132747.json',
                      title: 'Daftarkan keanggotaanmu',
                      subTitle:
                          'Kami disini hadir untuk membantumu untuk mendapatkan keanggotaan pensiunan. Banyak manfaat yang bisa kamu dapatkan jika kamu terdaftar sebagai anggota '),
                  OnBoardingContent(
                      img: 'assets/onboarding/Animation - 1709466234770.json',
                      title: 'Keamanan terjamin',
                      subTitle:
                          'Datamu akan kami jaga dengan baik, karena datamu sangat berharga bagi kami. Tunggu apa lagi, ayo bergabung bersama kami'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PageIndicator(controller: controller),
                  Obx(
                    () => InkWell(
                      onTap: () => controller.nextPage(),
                      splashColor: Colors.white10,
                      child: controller.buttonChanged(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
