import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class KeranjangViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/keranjang";

  List<KeranjangModel> _listKeranjang = [];

  List<KeranjangModel> get listKeranjang => _listKeranjang;

  Future getKeranjang() async {
    final token = AppConstants.token!;
    try {
      final response = await http.get(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $token",
        },
      );
      log("Get keranjang:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        _listKeranjang = data.map((e) => KeranjangModel.fromJson(e)).toList();
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future updateKeranjang({KeranjangModel? keranjang}) async {
    List mapKeranjang = _listKeranjang.map((e) => e.toMap()).toList();
    if (keranjang != null) mapKeranjang = [keranjang.toMap()];
    final token = AppConstants.token!;

    try {
      final response = await http.put(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(mapKeranjang),
      );
      log("Update keranjang:\n${response.body}");
      if (response.statusCode != 200) {
        final message = jsonDecode(response.body)["message"];
        log(message);
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
