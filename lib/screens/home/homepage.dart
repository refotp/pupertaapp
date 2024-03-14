import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/registerkta/registerktapage.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
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
            image: 'assets/profile/home-4329930-3599741.png',
            useActions: false,
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
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance
                      .collection('Users')
                      .doc(AuthenticationRepository().authUser?.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (!snapshot.hasData || !snapshot.data!.exists) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24.0),
                            child: Text(
                              'Ayo isi data dirimu',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          Center(
                            child: Lottie.asset(
                              'assets/home/Animation - 1709559490243 (1).json',
                              width: 320,
                              frameRate: const FrameRate(30.0),
                            ),
                          )
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error : ${snapshot.error}'));
                    } else {
                      controller.isVisible.value == false;
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Data anggota anda',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const RadialGradient(
                                      center: Alignment.topRight,
                                      radius: 3.5,
                                      colors: [
                                        ColorConst.tersier,
                                        Color.fromARGB(255, 73, 81, 202),
                                      ],
                                    ),
                                    image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        alignment: AlignmentDirectional(1, -12),
                                        image: AssetImage(
                                            'assets/home/background kartu.png'))),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Image.asset(
                                            'assets/login_signup/Untitled-1.png',
                                            width: 40,
                                            height: 40,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Kartu Anggota',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snapshot.data?['Nama Lengkap'],
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          const SizedBox(
                                            height: 4,
                                          ),
                                          const Text(
                                            'Nomor Anggota',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                          Text(
                                            snapshot.data?['Nomor Pensiun'],
                                            style: const TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: controller.isVisible.value
          ? null
          : FloatingActionButton(
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
