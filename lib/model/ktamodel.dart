class KtaModel {
  final String uid;
  final String namaLengkap;
  final String nomorPensiun;
  final String nomorIndukKependudukan;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  final String noAnggota;
  KtaModel(
      {required this.uid,
      required this.namaLengkap,
      required this.nomorPensiun,
      required this.nomorIndukKependudukan,
      required this.provinsi,
      required this.kabupaten,
      required this.kecamatan,
      required this.noAnggota});
  Map<String, dynamic> toJson() {
    return {
      'Uid': uid,
      'Nama Lengkap': namaLengkap,
      'Nomor Pensiun': nomorPensiun,
      'Nomor Induk Kependudukan': nomorIndukKependudukan,
      'Provinsi': provinsi,
      'Kabupaten': kabupaten,
      'Kecamatan': kecamatan,
      'No Anggota': noAnggota
    };
  }
}
