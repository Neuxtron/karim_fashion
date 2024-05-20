import 'package:karim_fashion/models/produk_model.dart';
import 'package:karim_fashion/models/stok_model.dart';

class KeranjangModel {
  final int? id;
  final ProdukModel produk;
  final StokModel ukuran;
  int amount;
  bool isChecked;

  KeranjangModel({
    this.id,
    required this.produk,
    required this.ukuran,
    this.amount = 1,
    this.isChecked = false,
  });

  factory KeranjangModel.fromJson(Map<String, dynamic> json) {
    return KeranjangModel(
      id: json["id"],
      produk: ProdukModel.fromJson(json["produk"]),
      ukuran: StokModel.fromJson(json["stok"]),
      amount: json["amount"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "idProduk": produk.id,
      "idStok": ukuran.id,
      "amount": amount,
    };
  }
}
