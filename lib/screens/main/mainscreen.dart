import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';
import 'package:ktaapp/screens/home/homepage.dart';
import 'package:ktaapp/screens/profile/profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = HomePageController();
    return Obx(
      () => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          HomePage(
            controller: controller,
          ),
          const ProfilePage(),
        ],
      ),
    );
  }
}
