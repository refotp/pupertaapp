import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/constants/stringconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.controller});
  final HomePageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InkWell(
                  onTap: () {},
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/home/profil_1.png'),
                  ),
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {
                controller.zoomDrawerController.open;
              },
              icon: const Icon(
                Ionicons.menu,
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.red,
            title: const Text(
              'Home',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  height: 200,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageChanged,
                    itemCount: StringConst.imageCarousel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  StringConst.imageCarousel[index]),
                              fit: BoxFit.fill),
                        ),
                        padding: const EdgeInsets.all(12.0),
                      );
                    },
                  ),
                ),
                Center(
                  child: SmoothPageIndicator(
                    controller: controller.pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        activeDotColor: ColorConst.merahMuda,
                        dotHeight: 5,
                        dotColor: ColorConst.abu),
                  ),
                ),
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
                    'assets/home/Animation - 1709559490243.json',
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
        onPressed: () {},
        backgroundColor: ColorConst.merahOren,
        child: const Icon(
          Ionicons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
