import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/screens/editprofile/editprofile.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:ktaapp/widgets/common/appbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          const AppBarWidget(
            title: 'My Profile',
            image: 'assets/profile/header halaman profil.png',
            useLeading: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: ColorConst.tersier,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage('assets/profile/profil_1.png'),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Refo',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  InkWell(
                                    overlayColor:
                                        const MaterialStatePropertyAll(
                                            Colors.transparent),
                                    onTap: () {
                                      Get.to(() => const EditProfilePage());
                                    },
                                    child: const Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Edit Profile',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(
                            color: Colors.white,
                            height: 1,
                            thickness: 1,
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Icon(
                                Ionicons.checkmark_circle,
                                color: ColorConst.sekunder,
                                size: 28,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'Aktif',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    color: ColorConst.tersier.withOpacity(0.2),
                    height: 1,
                    thickness: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                            color: ColorConst.tersier,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      ListTile(
                        leading: Icon(
                          Ionicons.mail_outline,
                          color: ColorConst.primer,
                        ),
                        title: Text('Utama'),
                        subtitle: Text(
                          'refotri2001@gmail.com',
                          style: TextStyle(
                              color: ColorConst.tersier,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Divider(
                    color: ColorConst.tersier.withOpacity(0.2),
                    height: 1,
                    thickness: 1,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nomor telefon',
                        style: TextStyle(
                            color: ColorConst.tersier,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      ListTile(
                        leading: Icon(
                          Ionicons.call_outline,
                          color: ColorConst.primer,
                        ),
                        title: Text('Utama'),
                        subtitle: Text(
                          '085869548854',
                          style: TextStyle(
                              color: ColorConst.tersier,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    AuthenticationRepository.instance.logout();
                  },
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
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
                            'Logout',
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
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
