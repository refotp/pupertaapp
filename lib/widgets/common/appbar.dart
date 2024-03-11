import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/widgets/common/menuwidget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.image,
    required this.useActions,
  });
  final String title, image;
  final bool useActions;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      expandedHeight: 140,
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
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      leading: const MenuWidget(),
      backgroundColor: ColorConst.primer,
      centerTitle: true,
    );
  }
}
