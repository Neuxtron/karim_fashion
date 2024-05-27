import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:karim_fashion/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel extends ChangeNotifier {
  final _endpoint = "${AppConstants.baseUrl}/user";
  UserModel? _currentUser;
  String? _token;

  UserModel? get currentUser => _currentUser;
  String? get token => _token;

  set token(String? newToken) => _setToken(newToken);

  Future<String> register(UserModel user) async {
    String error = "Terjadi kesalahan, silahkan coba lagi";

    try {
      final response = await http.post(
        Uri.parse("$_endpoint/register"),
        headers: {
          "Content-Type": "application/json",
        },
        body: user.toJson(),
      );
      log("Register user:\n${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        _currentUser = user;
        token = data["token"];
        error = "";
        notifyListeners();
      } else {
        error = jsonDecode(response.body)["message"];
      }
    } catch (e) {
      log(e.toString());
    }

    return error;
  }

  Future<String> login(String emailUsernamae, String password) async {
    try {
      final response = await http.post(
        Uri.parse("$_endpoint/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": emailUsernamae,
          "username": emailUsernamae,
          "password": password,
        }),
      );
      log("Login user:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        final jsonUser = data["user"];
        _currentUser = UserModel.fromJson(jsonUser);
        token = data["token"];
        notifyListeners();
        return "";
      } else {
        return jsonDecode(response.body)["message"];
      }
    } catch (e) {
      log(e.toString());
    }

    return "Terjadi kesalahan, silahkan coba lagi";
  }

  void getProfil() async {
    try {
      final response = await http.get(
        Uri.parse(_endpoint),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      log("Get profil:\n${response.body}");
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)["data"];
        _currentUser = UserModel.fromJson(data);
        notifyListeners();
      } else {
        logout();
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<String> updateProfil(UserModel user) async {
    String error = "Terjadi kesalahan, silahkan coba lagi";

    try {
      final response = await http.put(
        Uri.parse("$_endpoint/"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_token",
        },
        body: user.toJson(),
      );
      log("Update user:\n${response.body}");

      if (response.statusCode == 200) {
        _currentUser = user;
        error = "";
        notifyListeners();
      } else {
        error = jsonDecode(response.body)["message"];
      }
    } catch (e) {
      log(e.toString());
    }

    return error;
  }

  Future<bool> logout() async {
    try {
      final response = await http.get(
        Uri.parse("$_endpoint/logout"),
        headers: {
          "Authorization": "Bearer $_token",
        },
      );
      log("Logout user:\n${response.body}");
      token = null;
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString());
    }
    token = null;
    return false;
  }

  void _setToken(String? token) async {
    AppConstants.token = token;
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    if (token == null) {
      prefs.remove("TOKEN");
    } else {
      prefs.setString("TOKEN", token);
    }

    notifyListeners();
  }
}
