class StokModel {
  final int id;
  final String nama;
  final int stok;

  StokModel({
    required this.id,
    required this.nama,
    required this.stok,
  });

  factory StokModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return StokModel(
      id: json["id"],
      nama: json["variasi"]["nama"],
      stok: json["stok"],
    );
  }
}
