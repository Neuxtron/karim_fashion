class KecamatanModel {
  final String id;
  final String nama;

  KecamatanModel({
    required this.id,
    required this.nama,
  });

  factory KecamatanModel.fromJson(Map<String, dynamic> json) {
    return KecamatanModel(
      id: json["city_id"],
      nama: json["city_name"],
    );
  }
}
