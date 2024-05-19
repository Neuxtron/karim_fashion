import 'dart:convert';

class UserModel {
  final int? id;
  final String username;
  final String email;
  final String hp;
  final String alamat;
  final String idKecamatan;
  final String? password;

  UserModel({
    this.id,
    required this.username,
    required this.email,
    required this.hp,
    required this.alamat,
    required this.idKecamatan,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      hp: json["hp"],
      alamat: json["alamat"],
      idKecamatan: json["idKecamatan"],
    );
  }

  String toJson() {
    return jsonEncode({
      "username": username,
      "email": email,
      "hp": hp,
      "alamat": alamat,
      "idKecamatan": idKecamatan,
      "password": password,
    });
  }
}
