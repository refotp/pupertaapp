import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:ktaapp/services/supabaseservice.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:open_filex/open_filex.dart';
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class DaftarAnggotaController extends GetxController {
  RxList<dynamic> data = <dynamic>[].obs;
  Rx<List<Map<String, dynamic>>> anggotaList =
      Rx<List<Map<String, dynamic>>>([]);
  TextEditingController search = TextEditingController();
  RxString searchText = ''.obs;
  RxString status = ''.obs;
  final userId = SupBase.supabase.auth.currentUser?.id;
  final _service = SupabaseService();
  RxBool isPengurus = false.obs;
  RxBool isSuper = false.obs;
  RxBool isKetua = false.obs;
  @override
  void onInit() {
    fetchAllAnggota();
    getUserRole();
    super.onInit();
  }

  getUserRole() async {
    final role = await _service.getUserRole(userId!);
    if (role == 'Pengurus') {
      isPengurus.value = true;
    } else if (role == 'Super Admin' || role == 'Ketua') {
      isSuper.value = true;
      isKetua.value = true;
    } else {}
  }

  void fetchAllAnggota() async {
    try {
      final response = await SupBase.supabase
          .from('data_anggota')
          .select()
          .neq('user_id', AuthenticationRepository.instance.authUser!.id)
          .eq('user_role', 'Anggota')
          .eq('status', 'Aktif');
      anggotaList.value = response;
    } catch (e) {
      rethrow;
    }
  }

  void searchAnggota(String searchText) async {
    try {
      final response = await SupBase.supabase
          .from('data_anggota')
          .select()
          .or('fullname.ilike.%$searchText%,no_anggota.ilike.%$searchText%')
          .neq('user_role', 'Pengurus');

      anggotaList.value = response;
    } catch (e) {
      rethrow;
    }
  }

  void nonAktifAnggota(String idAnggota) async {
    try {
      await SupBase.supabase
          .from('data_anggota')
          .update({'status': 'Non-Aktif', 'user_role': 'Anggota'}).match(
              {'user_id': idAnggota});
      fetchAllAnggota();
      Get.back();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createAndDisplayPDF(BuildContext context) async {
    // Membuat PDF
    final pdf = pw.Document();
    final byteData = await rootBundle.load('assets/home/background kartu.png');
    final Uint8List imageData = byteData.buffer.asUint8List();
    final byteData2 =
        await rootBundle.load('assets/login_signup/logokartupuperta.png');
    final Uint8List imageData2 = byteData2.buffer.asUint8List();

    // Jumlah kartu maksimal per halaman
    final maxCardsPerPage = 4;

    // Ruang antara kartu
    final double cardSpacing = 20.0;

    // Menghitung jumlah halaman yang diperlukan berdasarkan jumlah anggota
    final pageCount = (anggotaList.value.length / maxCardsPerPage).ceil();

    // Menambahkan setiap halaman ke PDF
    for (int i = 0; i < pageCount; i++) {
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            final content = <pw.Widget>[];

            // Menghitung indeks anggota yang akan ditampilkan pada halaman ini
            final startIndex = i * maxCardsPerPage;
            final endIndex = (i + 1) * maxCardsPerPage;

            // Loop melalui setiap anggota untuk menambahkan kartu ke halaman
            for (var anggota in anggotaList.value.sublist(
                startIndex,
                endIndex < anggotaList.value.length
                    ? endIndex
                    : anggotaList.value.length)) {
              // Menyiapkan data anggota
              final String fullname = anggota['fullname'];
              final String noAnggota = anggota['no_anggota'];

              // Menambahkan kartu anggota ke halaman
              content.add(
                pw.Container(
                  width: 200,
                  height: 132,
                  margin: pw.EdgeInsets.only(bottom: cardSpacing),
                  decoration: pw.BoxDecoration(
                    borderRadius: pw.BorderRadius.circular(20),
                    gradient: const pw.RadialGradient(
                      center: pw.Alignment.topRight,
                      radius: 3.5,
                      colors: [
                        PdfColor.fromInt(0xFF0F1035),
                        PdfColor.fromInt(0xFF4951CA),
                      ],
                    ),
                    image: pw.DecorationImage(
                      image: pw.MemoryImage(imageData),
                      alignment: pw.Alignment.center,
                    ),
                  ),
                  child: pw.Padding(
                    padding: const pw.EdgeInsets.all(12.0),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        // Tambahkan informasi anggota
                        pw.Row(
                          mainAxisAlignment: pw.MainAxisAlignment.end,
                          children: [
                            pw.Container(
                              width: 28,
                              height: 28,
                              child: pw.Image(pw.MemoryImage(imageData2)),
                            ),
                          ],
                        ),
                        pw.Padding(
                          padding: const pw.EdgeInsets.only(bottom: 4),
                          child: pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'Kartu Anggota',
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              pw.Text(
                                fullname,
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                              pw.SizedBox(height: 4),
                              pw.Text(
                                'Nomor Anggota',
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.normal,
                                  fontSize: 12,
                                ),
                              ),
                              pw.Text(
                                noAnggota,
                                style: pw.TextStyle(
                                  color: PdfColors.white,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }

            return content;
          },
        ),
      );
    }

    // Menampilkan PDF
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
    OpenFilex.open(file.path);
  }

  void ubahStatus(String peran, String idAnggota) async {
    try {
      await SupBase.supabase
          .from('data_anggota')
          .update({'user_role': peran}).eq('user_id', idAnggota);
      await SupBase.supabase
          .from('user_data')
          .update({'role': peran}).eq('user_id', idAnggota);
      fetchAllAnggota();
    } catch (e) {
      throw '$e';
    }
  }
}
