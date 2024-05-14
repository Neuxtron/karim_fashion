import 'package:karim_fashion/models/produk_model.dart';

class KeranjangModel {
  final int? id;
  final ProdukModel produk;
  int amount;
  bool isChecked;

  KeranjangModel({
    this.id,
    required this.produk,
    this.amount = 1,
    this.isChecked = false,
  });
}
