import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/colorconst.dart';
import 'package:ktaapp/constants/stringconst.dart';
import 'package:ktaapp/controller/daftaranggota/daftaranggotacontroller.dart';
import 'package:ktaapp/screens/detailktaanggota/detailktapage.dart';
import 'package:ktaapp/widgets/common/appbar.dart';
import 'package:ktaapp/widgets/common/inputdecoration.dart';
import 'package:lottie/lottie.dart';

class DaftarAnggota extends StatelessWidget {
  const DaftarAnggota({super.key});

  @override
  Widget build(BuildContext context) {
    DaftarAnggotaController controller = Get.put(DaftarAnggotaController());
    controller.onInit();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const AppBarWidget(
              title: 'Daftar Anggota',
              image: 'assets/daftar_anggota/10353058-removebg-preview.png',
              useLeading: true),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.search,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          controller.searchAnggota(value);
                        } else {
                          controller.fetchAllAnggota();
                        }
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorConst.sekunder.withOpacity(0.25),
                        hintText: 'Cari nama atau nomor anggota',
                        hintStyle: const TextStyle(color: ColorConst.tersier),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.createAndDisplayPDF(context);
                      },
                      icon: const Icon(
                        Icons.print_rounded,
                        color: ColorConst.primer,
                      ))
                ],
              ),
            ),
          ),
          StreamBuilder<List<dynamic>>(
            stream: controller.anggotaList.stream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return SliverToBoxAdapter(child: Container());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Lottie.asset(
                          'assets/daftar_anggota/Animation - 1711180112138.json'),
                      const Text('Belum ada data anggota')
                    ],
                  ),
                );
              } else {
                final anggotaList = snapshot.data!;
                return SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final anggota = anggotaList[index];
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: ColorConst.tersier,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                anggota['url_foto']),
                                            radius: 28,
                                          ),
                                          const SizedBox(
                                            width: 16,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                anggota['fullname'],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                anggota['no_anggota'],
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                'Status : ${anggota['user_role']} ${anggota['status']}',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() =>
                                              DetailKtaPage(data: anggota));
                                        },
                                        child: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  controller.isPengurus.value ||
                                          controller.isSuper.value ||
                                          controller.isKetua.value
                                      ? Column(
                                          children: [
                                            const Divider(
                                              color: Colors.white,
                                              thickness: 1.5,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.dialog(
                                                      CupertinoAlertDialog(
                                                        title: const Text(
                                                            'Peringatan'),
                                                        content: const Text(
                                                            'Anda akan menonaktifkan pengguna ini, pengguna yang telah non-aktif tidak akan ditampilkan pada halaman ini dan sudah terhapus keanggotaanya. Apakah anda yakin ?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                'Tidak'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              controller
                                                                  .nonAktifAnggota(
                                                                      anggota[
                                                                          'user_id']);
                                                            },
                                                            child: const Text(
                                                                'Iya'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  overlayColor:
                                                      const MaterialStatePropertyAll(
                                                          Colors.transparent),
                                                  child: const SizedBox(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.delete,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Deaktivasi',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    Get.dialog(
                                                      CupertinoAlertDialog(
                                                        title: const Text(
                                                            'Peringatan'),
                                                        content: const Text(
                                                            'Status anggota ini akan diubah, anda yakin?'),
                                                        actions: [
                                                          TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: const Text(
                                                                'Tidak'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                              Get.dialog(
                                                                CupertinoAlertDialog(
                                                                  title: const Text(
                                                                      'Ubah Status'),
                                                                  content:
                                                                      Material(
                                                                    borderOnForeground:
                                                                        false,
                                                                    surfaceTintColor:
                                                                        Colors
                                                                            .transparent,
                                                                    color: Colors
                                                                        .transparent,
                                                                    shadowColor:
                                                                        Colors
                                                                            .transparent,
                                                                    child: DropdownButtonFormField<
                                                                        String>(
                                                                      items: controller.isSuper.value ||
                                                                              controller
                                                                                  .isKetua.value
                                                                          ? StringConst.dropDownDaftarAnggotaSuperKetua.map<DropdownMenuItem<String>>((String
                                                                              value) {
                                                                              return DropdownMenuItem<String>(
                                                                                value: value,
                                                                                child: Text(value),
                                                                              );
                                                                            }).toList()
                                                                          : StringConst
                                                                              .dropDownDaftarAnggotaPengurus
                                                                              .map<DropdownMenuItem<String>>((String value) {
                                                                              return DropdownMenuItem<String>(
                                                                                value: value,
                                                                                child: Text(value),
                                                                              );
                                                                            }).toList(),
                                                                      onChanged: (value) => controller
                                                                          .status
                                                                          .value = value!,
                                                                      decoration:
                                                                          textFieldDecoration(
                                                                              ''),
                                                                    ),
                                                                  ),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Batal',
                                                                        style: TextStyle(
                                                                            color:
                                                                                ColorConst.primer),
                                                                      ),
                                                                    ),
                                                                    TextButton(
                                                                      style: TextButton.styleFrom(
                                                                          textStyle:
                                                                              const TextStyle(color: ColorConst.sekunder)),
                                                                      onPressed:
                                                                          () {
                                                                        controller.ubahStatus(
                                                                            controller.status.value,
                                                                            anggota['user_id']);
                                                                        Get.back();
                                                                      },
                                                                      child:
                                                                          const Text(
                                                                        'Ubah',
                                                                        style: TextStyle(
                                                                            color:
                                                                                ColorConst.primer),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                            child: const Text(
                                                                'Iya'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  overlayColor:
                                                      const MaterialStatePropertyAll(
                                                          Colors.transparent),
                                                  child: const SizedBox(
                                                    child: Row(
                                                      children: [
                                                        Icon(
                                                          Icons.change_circle,
                                                          color: Colors.white,
                                                        ),
                                                        SizedBox(
                                                          width: 4,
                                                        ),
                                                        Text(
                                                          'Ubah status',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }, childCount: snapshot.data!.length),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
