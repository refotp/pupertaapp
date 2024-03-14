import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ktaapp/services/authenticationrepository.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final authUser = AuthenticationRepository().authUser;
  Future<void> saveDataAnggota(
      String nama,
      String nomorPensiun,
      String nomorIndukKependudukan,
      String provinsi,
      String kabupaten,
      String kecamatan,
      String imagePath) async {
    String imageFileName = '$nomorPensiun.jpg';
    Reference ref = _storage.ref().child('Foto Anggota').child(imageFileName);
    UploadTask uploadTask = ref.putFile(File(imagePath));
    TaskSnapshot downloadUrl = await uploadTask.whenComplete(() => null);
    String imageUrl = await downloadUrl.ref.getDownloadURL();

    await _firestore
        .collection('Users')
        .doc(authUser?.uid)
        .collection('Data Anggota')
        .doc(authUser?.uid)
        .set({
      'Nama Lengkap': nama,
      'Nomor Pensiun': nomorPensiun,
      'Nomor Induk Kependudukan': nomorIndukKependudukan,
      'Provinsi': provinsi,
      'Kabupaten': kabupaten,
      'Kecamatan': kecamatan,
      'imageUrl': imageUrl,
      'createdAt': Timestamp.now(),
    });
  }
}
