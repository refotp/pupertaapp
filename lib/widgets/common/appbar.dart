import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/widgets/common/menuwidget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.image,
    required this.useLeading,
  });
  final String title, image;
  final bool useLeading;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: 160,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white),
          ),
          SizedBox(
            width: 60,
            height: 60,
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
      leading: useLeading
          ? const MenuWidget()
          : IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_rounded),
              color: Colors.white,
            ),
      backgroundColor: ColorConst.primer,
      centerTitle: true,
    );
  }
}
