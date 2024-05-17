import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/views/keamanan_akun/password_item.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';

class KeamananAkunPage extends StatefulWidget {
  const KeamananAkunPage({super.key});

  @override
  State<KeamananAkunPage> createState() => _KeamananAkunPageState();
}

class _KeamananAkunPageState extends State<KeamananAkunPage> {
  final _lamaController = TextEditingController();
  final _baruController = TextEditingController();
  final _kBaruController = TextEditingController();

  void submitPassword() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 30),
                child: Text(
                  "Membuat kata sandi membantu Anda menjaga keamanan akun dan transaksi di Karim Fashion",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    fontSize: 13,
                  ),
                ),
              ),
              PasswordItem(
                controller: _lamaController,
                hintText: "Masukkan Kata Sandi Lama",
              ),
              PasswordItem(
                controller: _baruController,
                hintText: "Masukkan Kata Sandi Baru",
              ),
              PasswordItem(
                controller: _kBaruController,
                hintText: "Masukkan Ulang Kata Sandi Baru",
              ),
              MyButton(
                onPressed: submitPassword,
                text: "Ubah Kata Sandi",
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                margin: const EdgeInsets.only(top: 30),
                minWidth: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: AppConstants.primary,
      foregroundColor: Colors.white,
      titleSpacing: 0,
      title: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            "Karim Fashion",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
