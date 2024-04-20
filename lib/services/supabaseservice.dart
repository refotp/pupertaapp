import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ktaapp/constants/secrets.dart';
import 'package:ktaapp/model/usermodel.dart';
import 'package:ktaapp/services/authenticationrepository.dart';

import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService extends GetxController {
  static SupabaseService get instance => Get.find();

  Future<PostgrestResponse> getFirstFourDigits(String firstFourDigits) async {
    return await SupBase.supabase
        .from('data_anggota')
        .select('nik')
        .like('nik', '%$firstFourDigits%')
        .count(CountOption.estimated);
  }

  Future<void> uploadImage(String userId, String memberNumber, XFile? image,
      String imageExtension) async {
    if (image == null) {
      throw ArgumentError('Image parameter cannot be null');
    }
    final imageBytes = await image.readAsBytes();
    try {
      await SupBase.supabase.storage.from('foto_anggota').uploadBinary(
          '/$userId/profile', imageBytes,
          fileOptions:
              FileOptions(upsert: true, contentType: 'image/$imageExtension'));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveDataAnggota({
    required String nama,
    required String nomorPensiun,
    required String nik,
    required String memberNumber,
    required String imageUrl,
    required String provinsi,
    required String kabupaten,
    required String kecamatan,
    required String userRole,
    required String noTelp,
  }) async {
    try {
      await SupBase.supabase.from('data_anggota').insert({
        'fullname': nama,
        'no_pensiun': nomorPensiun,
        'nik': nik,
        'no_anggota': memberNumber,
        'url_foto': imageUrl,
        'provinsi': provinsi,
        'kota': kabupaten,
        'kecamatan': kecamatan,
        'user_role': userRole,
        'no_telp': noTelp,
      });
    } catch (e) {
      throw 'error : $e';
    }
  }

  Future<void> updateDataAnggota(
    String userId, {
    required String nama,
    required String nomorPensiun,
    required String nik,
    required String imageUrl,
    required String provinsi,
    required String kabupaten,
    required String kecamatan,
  }) async {
    try {
      await SupBase.supabase.from('data_anggota').update({
        'fullname': nama,
        'no_pensiun': nomorPensiun,
        'nik': nik,
        'url_foto': imageUrl,
        'provinsi': provinsi,
        'kota': kabupaten,
        'kecamatan': kecamatan,
      }).match({'user_id': userId});
    } catch (e) {
      throw 'error : $e';
    }
  }

  Stream<List<dynamic>> getAllAnggota({String? search}) async* {
    final userId = AuthenticationRepository.instance.authUser!.id;
    try {
      final listAnggota = SupBase.supabase
          .from('data_anggota')
          .select()
          .neq('user_id', userId)
          .ilike('fullname', '%$search%')
          .asStream();
      yield* listAnggota;
    } catch (e) {
      throw 'Error : $e';
    }
  }

  Future<List<dynamic>> searchAnggota(String nama) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.id;
      final searchQuery = '%$nama%';
      final result = await SupBase.supabase
          .from('data_anggota')
          .select()
          .neq('user_id', userId)
          .or('fullname.ilike.$searchQuery,no_anggota.ilike.$searchQuery');
      return result;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>> getUserData(String noPensiun) async {
    try {
      return await SupBase.supabase
          .from('data_anggota')
          .select()
          .eq('no_pensiun', noPensiun)
          .single();
    } catch (e) {
      throw '$e';
    }
  }

  getUserRole(String id) async {
    try {
      final user = await SupBase.supabase
          .from('user_data')
          .select('role')
          .eq('user_id', id)
          .single();

      return user.values.single;
    } catch (e) {
      throw '$e';
    }
  }

  getUserPhone(String id) async {
    try {
      final notelp = await SupBase.supabase
          .from('user_data')
          .select('notelp')
          .eq('user_id', id)
          .single();

      return notelp.values.single;
    } catch (e) {
      throw '$e';
    }
  }
}
