class StokModel {
  final String nama;
  final int stok;

  StokModel({
    required this.nama,
    required this.stok,
  });

  factory StokModel.fromJson(Map<String, dynamic> json) {
    return StokModel(
      nama: json["variasi"]["nama"],
      stok: json["stok"],
    );
  }
}
