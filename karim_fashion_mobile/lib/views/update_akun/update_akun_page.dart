import 'package:flutter/material.dart';
import 'package:karim_fashion/models/user_model.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/signup/kecamatan_dropdown.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:karim_fashion/views/widgets/form_input.dart';
import 'package:provider/provider.dart';

class UpdateAkunPage extends StatefulWidget {
  const UpdateAkunPage({super.key});

  @override
  State<UpdateAkunPage> createState() => _UpdateAkunPageState();
}

class _UpdateAkunPageState extends State<UpdateAkunPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _alamatController = TextEditingController();

  int _idKecamatan = 1;

  void submitUpdate() {}

  void updateInput(UserModel user) {
    _usernameController.text = user.username;
    _emailController.text = user.email;
    _noHpController.text = user.hp;
    _alamatController.text = user.alamat;
  }

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().currentUser;
    updateInput(user);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              const Text(
                "Update Akun",
                style: TextStyle(fontSize: 22),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Image.asset("assets/images/logo.png", height: 80),
              ),
              const SizedBox(height: 16), //----- Jarak
              FormInput(
                label: "Username",
                controller: _usernameController,
              ),
              FormInput(
                label: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              FormInput(
                label: "No HP",
                controller: _noHpController,
                keyboardType: TextInputType.phone,
              ),
              FormInput(
                label: "Alamat",
                hintText: "Masukkan alamat",
                controller: _alamatController,
                multiline: true,
              ),
              KecamatanDropdown(
                value: _idKecamatan,
                onChange: (value) => setState(() => _idKecamatan = value!),
              ),
              MyButton(
                onPressed: submitUpdate,
                margin: const EdgeInsets.only(top: 50),
                text: "Simpan",
                minWidth: double.infinity,
                textColor: Colors.black,
              ),
              const SizedBox(height: 32), //----- Jarak
            ],
          ),
        ),
      ),
    );
  }
}
