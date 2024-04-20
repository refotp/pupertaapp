import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.controller});
  final HomePageController controller;

  @override
  Widget build(BuildContext context) {
    print(controller.isSuper.value);
    return Scaffold(
      backgroundColor: ColorConst.tersier,
      body: Theme(
        data: ThemeData.dark(),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(50)),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/login_signup/Untitled-1 copy.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(height: 10),
            _buildMenuItem(context, 0, 'Home', Ionicons.home),
            _buildMenuItem(context, 1, 'Profile', Ionicons.person),
            Obx(
              () => Container(
                child: controller.isPengurus.value ||
                        controller.isSuper.value ||
                        controller.isKetua.value
                    ? _buildMenuItem(context, 2, 'Anggota', Icons.group)
                    : Container(),
              ),
            ),
            Obx(
              () => Container(
                child: controller.isSuper.value || controller.isKetua.value
                    ? _buildMenuItem(context, 3, 'Super Admin',
                        CupertinoIcons.lock_shield_fill)
                    : Container(),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context, int index, String title, IconData icon) {
    bool isSelected = index == controller.currentIndex.value;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? const Color.fromARGB(25, 255, 255, 255) : null,
      ),
      child: ListTile(
        onTap: () {
          controller.onPageChanged(index);
          ZoomDrawer.of(context)!.close();
        },
        title: Text(
          title,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : null, // Set text color to white if selected
          ),
        ),
        leading: Icon(
          icon,
          color: isSelected
              ? Colors.white
              : null, // Set icon color to white if selected
        ),
      ),
    );
  }
}
