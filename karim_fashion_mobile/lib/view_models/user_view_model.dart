import 'package:flutter/material.dart';
import 'package:karim_fashion/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel _currentUser = UserModel(
    username: "Deny_20",
    email: "deny20@gmail.com",
    hp: "081109875423",
    alamat:
        "Jln Bunga Ncole 14B NO.51, Kemengan Tani, Medan Tuntungan MEDAN TUNTUNGAN, KOTA MEDAN,  SUMATERA UTARA, ID 20137",
    idKecamatan: 1,
    gambar: "",
  );

  UserModel get currentUser => _currentUser;
}
