import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/models/order_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class OrderViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/order";

  Future<bool> createOrder(
      OrderModel order, List<KeranjangModel> listKeranjang) async {
    final mapKeranjang = listKeranjang.map((e) => e.toMap()).toList();
    final token = AppConstants.token;

    try {
      final response = await http.post(
        Uri.parse(_endpoint),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode({
          "order": order.toMap(),
          "keranjang": mapKeranjang,
        }),
      );
      log("Create order:\n${response.body}");
      return response.statusCode == 201;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
