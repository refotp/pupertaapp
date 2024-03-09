import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/home/homepage.dart';
import 'package:ktaapp/screens/menu/menuscreen.dart';
import 'package:ktaapp/screens/profile/profile.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Obx(
      () => ZoomDrawer(
        borderRadius: 40,
        angle: 0,
        showShadow: true,
        menuBackgroundColor: ColorConst.abuTua,
        menuScreen: MenuScreen(
          controller: controller,
        ),
        mainScreen: _getCurrentPage(controller.currentIndex.value),
      ),
    );
  }

  Widget _getCurrentPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}
