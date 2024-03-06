import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  final zoomDrawerController = ZoomDrawerController();

  RxInt currentIndex = 0.obs;
  PageController pageController = PageController(viewportFraction: 0.9);
  void onPageChanged(index) {
    currentIndex.value = index;
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }
}
