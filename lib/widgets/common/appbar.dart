import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/widgets/common/menuwidget.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      leading: const MenuWidget(),
      backgroundColor: ColorConst.merahOren,
      centerTitle: true,
      title: Text(
        title,
        style:
            const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
