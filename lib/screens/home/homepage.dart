import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/detailktaanggota/detailktapage.dart';
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
    controller.onInit();
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const AppBarWidget(
              title: 'Home',
              image: 'assets/profile/home-4329930-3599741.png',
              useLeading: true,
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
                  // StreamBuilder(
                  //   stream: controller.getAnggota(),
                  //   builder: (context, snapshot) {
                  //     if (snapshot.connectionState == ConnectionState.waiting) {
                  //       return const Center(
                  //         child: CircularProgressIndicator(
                  //           color: Colors.blue,
                  //         ),
                  //       );
                  //     } else if( snapshot.hasError ){
                  //       return Container();
                  //     } else if (!snapshot.hasData){

                  //     }
                  //     else {}
                  //   },
                  // )
                  FutureBuilder(
                    future: controller.getAnggota(),
                    builder: (context, AsyncSnapshot<dynamic> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.blue,
                            ),
                          );
                        case ConnectionState.done:
                          final anggotaList = snapshot.data as List<dynamic>;
                          if (snapshot.hasError) {
                            return Container();
                          } else if (!snapshot.hasData || anggotaList.isEmpty) {
                            controller.isVisible.value = true;
                            // print('object');
                            return Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Text(
                                      'Ayo isi data anggotamu',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Lottie.asset(
                                        'assets/home/Animation - 1709559490243 (1).json')
                                  ],
                                ),
                              ),
                            );
                          } else if (snapshot.hasData) {
                            // print('disini');
                            controller.isVisible.value =
                                !controller.isVisible.value;
                            final anggota = anggotaList[0];
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Data anggota anda',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.transparent),
                                    onTap: () {
                                      final anggotaList =
                                          snapshot.data as List<dynamic>;
                                      Get.to(() => DetailKtaPage(
                                            data: anggotaList[0],
                                          ));
                                    },
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
                                          alignment:
                                              AlignmentDirectional(0, -2),
                                          image: AssetImage(
                                              'assets/home/background kartu.png'),
                                        ),
                                      ),
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
                                                  'assets/login_signup/logokartupuperta.png',
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
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  anggota['fullname'],
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                const Text(
                                                  'Nomor Anggota',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  anggota['no_anggota'],
                                                  style: const TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
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
                          } else {
                            return Container();
                          }
                        default:
                          return Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Center(
                              child: Column(
                                children: [
                                  const Text(
                                    'Ayo isi data anggotamu',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Lottie.asset(
                                      'assets/home/Animation - 1709559490243 (1).json')
                                ],
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (controller.isVisible.value == false) {
              Get.snackbar('', '',
                  titleText: const Text(
                    'Peringatan',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.white),
                  ),
                  messageText: const Text(
                    'Anda sudah mendaftarkan KTA anda, apabila ingin mengubah data, tekan kartu KTA anda',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                  snackPosition: SnackPosition.TOP,
                  icon: const Icon(
                    CupertinoIcons.exclamationmark_triangle_fill,
                    color: Colors.white,
                  ));
            } else {
              final role = controller.role;
              Get.to(() => RegisterKta(
                    role: role,
                  ));
            }
            // print(controller.isVisible.value);
          },
          backgroundColor: ColorConst.primer,
          child: const Icon(
            Ionicons.add,
            color: Colors.white,
          ),
        ));
  }
}
