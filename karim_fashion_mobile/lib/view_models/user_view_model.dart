import 'package:flutter/material.dart';
import 'package:karim_fashion/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  UserModel _currentUser = UserModel(
    username: "Rifaa",
    email: "zuzuzu@gmail.com",
    hp: "(+62) 819-7673-9942",
    alamat:
        "Jln Bunga Ncole 14B NO.51, Kemengan Tani, Medan Tuntungan MEDAN TUNTUNGAN, KOTA MEDAN,  SUMATERA UTARA, ID 20137",
    idKecamatan: 1,
  );

  UserModel get currentUser => _currentUser;
}
