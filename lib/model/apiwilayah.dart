class Provinsi {
  final String id;
  final String nama;

  Provinsi({
    required this.id,
    required this.nama,
  });

  factory Provinsi.fromJson(Map<String, dynamic> json) {
    return Provinsi(id: json["id"], nama: json["nama"]);
  }
}
