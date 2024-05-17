import 'package:flutter/material.dart';
import 'package:karim_fashion/views/signup/kecamatan_dropdown.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:karim_fashion/views/widgets/form_input.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _noHpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _kPasswordController = TextEditingController();
  final _alamatController = TextEditingController();

  int _idKecamatan = 1;

  void submitSignup() {}

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _passwordController.dispose();
    _kPasswordController.dispose();
    _alamatController.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                "Signup",
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
                label: "Password",
                controller: _passwordController,
                obscureText: true,
              ),
              FormInput(
                label: "Konfirmasi Password",
                hintText: "Ketik ulang password",
                controller: _kPasswordController,
                obscureText: true,
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
                onPressed: submitSignup,
                margin: const EdgeInsets.only(top: 50),
                text: "Daftar",
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
