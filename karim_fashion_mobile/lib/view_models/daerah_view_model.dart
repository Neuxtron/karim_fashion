import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karim_fashion/models/kecamatan_model.dart';
import 'package:karim_fashion/models/provinsi_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class DaerahViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/daerah";

  Future<List<ProvinsiModel>> getProvinsi() async {
    try {
      final response = await http.get(Uri.parse("$_endpoint/provinsi"));
      log("Get provinsi:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        final listProvinsi =
            data.map((e) => ProvinsiModel.fromJson(e)).toList();
        return listProvinsi;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }

  Future<List<KecamatanModel>> getKecamatan(String idProvinsi) async {
    try {
      final response =
          await http.get(Uri.parse("$_endpoint/kecamatan/$idProvinsi"));
      log("Get kecamatan:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"] as List;
        final listKecamatan =
            data.map((e) => KecamatanModel.fromJson(e)).toList();
        return listKecamatan;
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
