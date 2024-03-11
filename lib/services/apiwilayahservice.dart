import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static var client = http.Client();

  static Future<List> fetchProvinsi() async {
    final response = await client.get(
      Uri.parse(
          'https://www.emsifa.com/api-wilayah-indonesia/api/provinces.json'),
    );

    if (response.statusCode == 200) {
      List provinces = jsonDecode(response.body);

      return provinces;
    } else {
      throw Exception('Failed to fetch provinces');
    }
  }

  static Future<List> fetchKabupaten(String kodeProv) async {
    final response = await client.get(
      Uri.parse(
          'https://www.emsifa.com/api-wilayah-indonesia/api/regencies/$kodeProv.json'),
    );
    if (response.statusCode == 200) {
      List kabupaten = jsonDecode(response.body);
      return kabupaten;
    } else {
      throw Exception('Failed to get kabupaten');
    }
  }

  static Future<List> fetchKecamatan(String kodeKab) async {
    final response = await client.get(Uri.parse(
        'https://www.emsifa.com/api-wilayah-indonesia/api/districts/$kodeKab.json'));
    if (response.statusCode == 200) {
      List kecamatan = jsonDecode(response.body);
      return kecamatan;
    } else {
      throw Exception('Failed to get kecamatan');
    }
  }
}
