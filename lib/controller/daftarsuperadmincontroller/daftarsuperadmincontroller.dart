import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/services/authenticationrepository.dart';
import 'package:ktaapp/services/supabaseservice.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class DaftarSuperAdminController extends GetxController {
  static DaftarSuperAdminController get instance => Get.find();
  RxList<dynamic> data = <dynamic>[].obs;
  Rx<List<Map<String, dynamic>>> superAdminList =
      Rx<List<Map<String, dynamic>>>([]);
  TextEditingController search = TextEditingController();
  RxString searchText = ''.obs;
  final _service = SupabaseService();
  final userId = SupBase.supabase.auth.currentUser?.id;
  RxBool isKetua = false.obs;
  RxString status = ''.obs;
  @override
  void onInit() {
    fetchAllsuperAdmin();
    getUserRole();
    super.onInit();
  }

  void fetchAllsuperAdmin() async {
    try {
      final response = await SupBase.supabase
          .from('data_anggota')
          .select()
          .neq('user_id', AuthenticationRepository.instance.authUser!.id)
          .eq('user_role', 'Super Admin')
          .eq('status', 'Aktif');
      superAdminList.value = response;
    } catch (e) {
      rethrow;
    }
  }

  void searchSuperAdmin(String searchText) async {
    try {
      final response = await SupBase.supabase
          .from('data_anggota')
          .select()
          .or('fullname.ilike.%$searchText%,no_anggota.ilike.%$searchText%')
          .eq('user_role', 'Super Admin')
          .eq('status', 'Aktif')
          .neq('user_id', AuthenticationRepository.instance.authUser!.id);
      superAdminList.value = response;
    } catch (e) {
      rethrow;
    }
  }

  void nonAktifSuperAdmin(String idSuper) async {
    try {
      await SupBase.supabase
          .from('user_data')
          .update({'role': 'Anggota'}).match({'user_id': idSuper});
      await SupBase.supabase
          .from('data_anggota')
          .update({'status': 'Non-Aktif', 'user_role': 'Anggota'}).match(
              {'user_id': idSuper});
      fetchAllsuperAdmin();
      Get.back();
    } catch (e) {
      throw '$e';
    }
  }

  void ubahStatus(String peran, String idSuper) async {
    try {
      await SupBase.supabase
          .from('data_anggota')
          .update({'user_role': peran}).eq('user_id', idSuper);
      await SupBase.supabase
          .from('user_data')
          .update({'role': peran}).eq('user_id', idSuper);
      fetchAllsuperAdmin();
    } catch (e) {
      throw '$e';
    }
  }

  Future<void> createAndDisplayPDF(BuildContext context) async {
    final pdf = pw.Document();
    final byteData = await rootBundle.load('assets/home/background kartu.png');
    final Uint8List imageData = byteData.buffer.asUint8List();
    final byteData2 =
        await rootBundle.load('assets/login_signup/logokartupuperta.png');
    final Uint8List imageData2 = byteData2.buffer.asUint8List();

    const maxCardsPerPage = 4;

    const double cardSpacing = 20.0;

    final pageCount = (superAdminList.value.length / maxCardsPerPage).ceil();

    for (int i = 0; i < pageCount; i++) {
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            final content = <pw.Widget>[];

            final startIndex = i * maxCardsPerPage;
            final endIndex = (i + 1) * maxCardsPerPage;

            for (var anggota in superAdminList.value.sublist(
                startIndex,
                endIndex < superAdminList.value.length
                    ? endIndex
                    : superAdminList.value.length)) {
              final String fullname = anggota['fullname'];
              final String noAnggota = anggota['no_anggota'];

              content.add(
                pw.Container(
                  width: 200,
                  height: 132,
                  margin: const pw.EdgeInsets.only(bottom: cardSpacing),
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

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
    OpenFilex.open(file.path);
  }

  getUserRole() async {
    final role = await _service.getUserRole(userId!);
    if (role == 'Ketua') {
      isKetua.value = true;
    }
  }
}
