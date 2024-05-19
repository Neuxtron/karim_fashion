import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:karim_fashion/models/produk_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class ProdukViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/produk";

  List<ProdukModel> _listProduk = [];
  ServerStatus _status = ServerStatus.normal;

  List<ProdukModel> get listProduk => _listProduk;
  ServerStatus get status => _status;

  List<ProdukModel> byCategory(int idKategori) {
    return _listProduk
        .where((produk) => produk.idKategori == idKategori)
        .toList();
  }

  Future getProduk() async {
    _status = ServerStatus.loading;
    notifyListeners();

    try {
      final response = await http.get(Uri.parse(_endpoint));
      log("Get produk:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        _listProduk = data.map((e) => ProdukModel.fromJson(e)).toList();

        _status = ServerStatus.normal;
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
      _status = ServerStatus.error;
      notifyListeners();
    }
  }
}
