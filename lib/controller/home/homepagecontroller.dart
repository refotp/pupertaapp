import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
// import 'package:pdf/pdf.dart' as pw;
// import 'package:open_filex/open_filex.dart';

class HomePageController extends GetxController {
  static HomePageController get instance => Get.find();
  final zoomDrawerController = ZoomDrawerController();
  final RxInt currentIndex = 0.obs;
  final RxList<DocumentSnapshot> data = <DocumentSnapshot>[].obs;
  RxBool isVisible = true.obs;
  PageController pageController = PageController(viewportFraction: 0.9);
  void onPageChanged(index) {
    currentIndex.value = index;
  }

  void toggleDrawer() {
    zoomDrawerController.toggle?.call();
  }
}
