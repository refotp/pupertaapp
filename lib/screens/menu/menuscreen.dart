import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:ionicons/ionicons.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/home/homepagecontroller.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key, required this.controller});
  final HomePageController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.abuTua,
      body: Theme(
        data: ThemeData.dark(),
        child: Column(
          children: [
            const Spacer(),
            _buildMenuItem(context, 0, 'Home', Ionicons.home),
            _buildMenuItem(context, 1, 'Profile', Ionicons.person),
            const Spacer(
              flex: 2,
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
