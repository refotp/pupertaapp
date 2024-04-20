import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/bottomnavcontroller/bottomnavcontroller.dart';
import 'package:ktaapp/screens/daftaranggota/daftaranggota.dart';
import 'package:ktaapp/screens/daftarpengurus.dart/daftarpengurus.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BottomNavController();
    return Scaffold(
        body: Obx(
          () => IndexedStack(
            index: controller.selectedIndex,
            children: const [DaftarAnggota(), DaftarPengurus()],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              selectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              unselectedLabelStyle:
                  const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.blue[700],
              selectedItemColor: Colors.white,
              unselectedItemColor: ColorConst.tersier,
              currentIndex: controller.selectedIndex,
              onTap: (index) {
                controller.setSelectedIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.group),
                  label: 'Anggota',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.admin_panel_settings_rounded),
                    label: 'Pengurus'),
              ]),
        ));
  }
}
