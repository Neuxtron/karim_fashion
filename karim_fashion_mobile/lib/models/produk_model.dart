import 'package:karim_fashion/models/stok_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class ProdukModel {
  final int id;
  final String gambar;
  final String nama;
  final int harga;
  final int idKategori;
  final List<StokModel> listUkuran;
  final String deskripsi;

  ProdukModel({
    required this.id,
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.idKategori,
    required this.listUkuran,
    required this.deskripsi,
  });

  factory ProdukModel.fromJson(Map<String, dynamic> json) {
    final ukuranJson = json["stok"] as List;
    final listUkuran = ukuranJson.map((e) => StokModel.fromJson(e)).toList();
    final gambar = json["gambar"];

    return ProdukModel(
      id: json["id"],
      gambar: "${AppConstants.baseUrl}/images/$gambar",
      nama: json["nama"],
      harga: json["harga"],
      idKategori: json["idKategori"],
      listUkuran: listUkuran,
      deskripsi: json["deskripsi"],
    );
  }
}
