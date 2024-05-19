import 'package:flutter/material.dart';
import 'package:karim_fashion/models/keranjang_model.dart';

class KeranjangViewModel extends ChangeNotifier {
  List<KeranjangModel> _listKeranjang = [];

  List<KeranjangModel> get listKeranjang => _listKeranjang;
}
