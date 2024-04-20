import 'dart:io';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/services/supabaseservice.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailKtaController extends GetxController {
  static DetailKtaController get instance => Get.find();
  final isLoading = true.obs;
  final isHidden = true.obs;

  final _supabaseService = SupabaseService();

  Future<void> getUser(data) async {
    final userId = SupBase.supabase.auth.currentUser?.id;
    final kartuId = data['user_id'];
    final role = await _supabaseService.getUserRole(userId!);
    if (userId == kartuId || role == 'Super Admin' || role == 'Ketua') {
      isHidden.value = false;
    }

    isLoading.value = false;
  }

  Future<void> generatePdf(dynamic data) async {
    final pdf = pw.Document();
    final byteData = await rootBundle.load('assets/home/background kartu.png');
    final Uint8List imageData = byteData.buffer.asUint8List();
    final byteData2 =
        await rootBundle.load('assets/login_signup/logokartupuperta.png');
    final Uint8List imageData2 = byteData2.buffer.asUint8List();
    final imageProvider = pw.MemoryImage(imageData);
    final imageProvider2 = pw.MemoryImage(imageData2);

    pdf.addPage(pw.Page(
      build: (context) {
        return pw.Column(children: [
          pw.Container(
            width: 200,
            height: 132,
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
                  image: imageProvider,
                  alignment: const pw.Alignment(0, 0),
                )),
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(12.0),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.end,
                    children: [
                      pw.Container(
                          width: 28,
                          height: 28,
                          child: pw.Image(imageProvider2)),
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
                              fontSize: 12),
                        ),
                        pw.Text(
                          data['fullname'],
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 12),
                        ),
                        pw.SizedBox(
                          height: 4,
                        ),
                        pw.Text(
                          'Nomor Anggota',
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.normal,
                              fontSize: 12),
                        ),
                        pw.Text(
                          data['no_anggota'],
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]);
      },
    ));
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/example.pdf");
    await file.writeAsBytes(await pdf.save());
    OpenFilex.open(file.path);
  }
}
