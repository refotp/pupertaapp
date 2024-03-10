import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/registerkta/registerktapage.dart';
import 'package:ktaapp/widgets/common/appbar.dart';
import 'package:ktaapp/widgets/home/carousell.dart';
import 'package:ktaapp/widgets/home/carousellindicator.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
            title: 'Home',
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Carousell(controller: controller),
                CarouselIndicator(controller: controller),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Ayo isi data dirimu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                Center(
                  child: Lottie.asset(
                    'assets/home/Animation - 1709559490243 (1).json',
                    width: 320,
                    frameRate: const FrameRate(30.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const RegisterKta());
        },
        backgroundColor: ColorConst.primer,
        child: const Icon(
          Ionicons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
