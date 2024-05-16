import 'package:karim_fashion/models/produk_model.dart';

class KeranjangModel {
  final int? id;
  final ProdukModel produk;
  final String ukuran;
  int amount;
  bool isChecked;

  KeranjangModel({
    this.id,
    required this.produk,
    required this.ukuran,
    this.amount = 1,
    this.isChecked = false,
  });
}
