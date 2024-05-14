import 'package:flutter/material.dart';
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

  void submitSignup() {}

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _noHpController.dispose();
    _passwordController.dispose();
    _kPasswordController.dispose();
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
