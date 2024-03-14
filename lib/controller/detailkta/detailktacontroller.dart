import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:open_filex/open_filex.dart';
import 'package:pdf/widgets.dart' as pw;

class DetailKtaController extends GetxController {
  static DetailKtaController get instance => Get.find();

  Future<void> generatePdf(
      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> data) async {
    final pdf = pw.Document();

    // Load the image from the asset bundle
    final byteData = await rootBundle.load('assets/home/background kartu.png');
    final Uint8List imageData = byteData.buffer.asUint8List();
    final byteData2 =
        await rootBundle.load('assets/login_signup/Untitled-1 copy.png');
    final Uint8List imageData2 = byteData2.buffer.asUint8List();
    // Convert the image to a PdfImage object
    final imageProvider = pw.MemoryImage(imageData);
    final imageProvider2 = pw.MemoryImage(imageData2);

    pdf.addPage(pw.Page(
      build: (context) {
        return pw.Column(children: [
          pw.Container(
            width: 260,
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
                          width: 40,
                          height: 40,
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
                              fontSize: 16),
                        ),
                        pw.Text(
                          data.data?['Nama Lengkap'],
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 16),
                        ),
                        pw.SizedBox(
                          height: 4,
                        ),
                        pw.Text(
                          'Nomor Anggota',
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.normal,
                              fontSize: 16),
                        ),
                        pw.Text(
                          data.data?['Nomor Pensiun'],
                          style: pw.TextStyle(
                              color: PdfColors.white,
                              fontWeight: pw.FontWeight.bold,
                              fontSize: 16),
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

    // Open the PDF file using the `open_file` package
    OpenFilex.open(file.path);
  }
}
