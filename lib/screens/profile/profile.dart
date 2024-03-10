import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
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
          const AppBarWidget(title: 'My Profile'),
          SliverToBoxAdapter(
            child: Column(
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
                                    AssetImage('assets/home/profil_1.png'),
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
                                        fontSize: 24),
                                  ),
                                  const Text(
                                    'refo@gmail.com',
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                  InkWell(
                                    overlayColor: MaterialStatePropertyAll(
                                        Colors.transparent),
                                    onTap: () {},
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
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            width: double.infinity,
                            height: 1,
                            color: Colors.white70,
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
                                    fontWeight: FontWeight.bold),
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
                  child: Container(
                    width: double.infinity,
                    height: 1,
                    color: ColorConst.abu,
                  ),
                ),
                InkWell(
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: ColorConst.tersier,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const ListTile(
                        leading: Icon(CupertinoIcons.person_crop_rectangle),
                        iconColor: Colors.white,
                        textColor: Colors.white,
                        title: Text('Kartu Tanda Anggota'),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                        ),
                      ),
                    ),
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
                  onTap: () {},
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
                                fontWeight: FontWeight.bold),
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
