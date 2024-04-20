import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/detailkta/detailktacontroller.dart';
import 'package:ktaapp/widgets/common/appbar.dart';

class DetailKtaPengurus extends StatelessWidget {
  const DetailKtaPengurus({super.key, required this.data});
  final dynamic data;
  @override
  Widget build(BuildContext context) {
    final controller = DetailKtaController();
    controller.getUser(data);

    return Scaffold(body: Obx(() {
      if (controller.isLoading.value == true) {
        return const CircularProgressIndicator(
          color: Colors.blue,
        );
      } else {
        return CustomScrollView(
          slivers: [
            const AppBarWidget(
                title: 'Detail KTA',
                image: 'assets/detailkta/credit-cards-3d-illustration-png.png',
                useLeading: false),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide.none,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: ColorConst.tersier,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(32),
                              child: Image.network(
                                data['url_foto'],
                                fit: BoxFit.cover,
                                width: 160,
                                height: 160,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.at),
                              title: const Text(
                                'Nama Lengkap : ',
                              ),
                              subtitle: Text(
                                data['fullname'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.person_3_fill),
                              title: const Text(
                                'Nomor Pensiun : ',
                              ),
                              subtitle: Text(
                                data['no_pensiun'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.person_3_fill),
                              title: const Text(
                                'Nomor Anggota : ',
                              ),
                              subtitle: Text(
                                data['no_anggota'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.person_3_fill),
                              title: const Text(
                                'Status : ',
                              ),
                              subtitle: Text(
                                '${data['status']} ${data['user_role']}',
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading:
                                  const Icon(CupertinoIcons.person_circle_fill),
                              title: const Text(
                                'Nomor Induk Kependudukan : ',
                              ),
                              subtitle: Text(
                                data['nik'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading:
                                  const Icon(CupertinoIcons.person_circle_fill),
                              title: const Text(
                                'Nomor Telepon ',
                              ),
                              subtitle: Text(
                                controller.isHidden.value
                                    ? '*****'
                                    : data['no_telp'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.location_fill),
                              title: const Text(
                                'Provinsi',
                              ),
                              subtitle: Text(
                                data['provinsi'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.location_fill),
                              title: const Text(
                                'Kabupaten',
                              ),
                              subtitle: Text(
                                data['kota'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            ListTile(
                              iconColor: ColorConst.sekunder,
                              textColor: Colors.white,
                              leading: const Icon(CupertinoIcons.location_fill),
                              title: const Text(
                                'Kecamatan',
                              ),
                              subtitle: Text(
                                data['kecamatan'],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Divider(
                                color: Colors.white60,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: InkWell(
                                onTap: () {
                                  controller.generatePdf(data);
                                },
                                child: Container(
                                  width: 140,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorConst.primer,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Cetak',
                                      style: TextStyle(
                                          color: ColorConst.komplementeri,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }
    }));
  }
}
