import 'package:get/get.dart';

class BottomNavController extends GetxController {
  static BottomNavController get instance => Get.find();
  final RxInt _selectedIndex = 0.obs;

  int get selectedIndex => _selectedIndex.value;

  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }
}
