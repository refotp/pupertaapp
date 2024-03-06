import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

class NavigationPageController extends GetxController {
  static NavigationPageController get instance => Get.find();
  final zoomDrawerController = ZoomDrawerController();
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
}
