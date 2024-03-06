import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:ktaapp/controller/home/homepagecontroller.dart';

import 'package:ktaapp/screens/home/homepage.dart';
import 'package:ktaapp/screens/menu/menuscreen.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Material(
      child: ZoomDrawer(
        controller: controller.zoomDrawerController,
        menuScreen: const MenuScreen(),
        mainScreen: HomePage(
          controller: controller,
        ),
        borderRadius: 24.0,
      ),
    );
  }
}
