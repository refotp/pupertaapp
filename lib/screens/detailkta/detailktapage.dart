import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/controller/detailkta/detailktacontroller.dart';
import 'package:ktaapp/widgets/common/appbar.dart';

class DetailKtaPage extends StatelessWidget {
  const DetailKtaPage({super.key, required this.data});
  final AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> data;
  @override
  Widget build(BuildContext context) {
    final controller = DetailKtaController();
    return Scaffold(
      body: CustomScrollView(
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
                              data.data?['imageUrl'],
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
                              data.data?['Nama Lengkap'],
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
                              data.data?['Nomor Pensiun'],
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
                              data.data?['Nomor Induk Kependudukan'],
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
                              data.data?['Provinsi'],
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
                              data.data?['Kabupaten'],
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
                              data.data?['Kecamatan'],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 140,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: ColorConst.primer,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Center(
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(
                                          color: ColorConst.komplementeri,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
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
                            ],
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
      ),
    );
  }
}
