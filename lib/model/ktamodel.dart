class KtaModel {
  final String namaLengkap;
  final String nomorPensiun;
  final String nomorIndukKependudukan;
  final String provinsi;
  final String kabupaten;
  final String kecamatan;
  KtaModel({
    required this.namaLengkap,
    required this.nomorPensiun,
    required this.nomorIndukKependudukan,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
  });
  Map<String, dynamic> toJson() {
    return {
      'Nama Lengkap': namaLengkap,
      'Nomor Pensiun': nomorPensiun,
      'Nomor Induk Kependudukan': nomorIndukKependudukan,
      'Provinsi': provinsi,
      'Kabupaten': kabupaten,
      'Kecamtan': kecamatan
    };
  }
}
