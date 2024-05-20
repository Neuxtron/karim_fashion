import 'package:karim_fashion/models/pembayaran_model.dart';

class OrderModel {
  final PembayaranModel metodeBayar;
  final int ongkir;

  OrderModel({
    required this.metodeBayar,
    required this.ongkir,
  });

  Map<String, dynamic> toMap() {
    return {
      "metodeBayar": metodeBayar.text,
      "ongkir": ongkir,
    };
  }
}
