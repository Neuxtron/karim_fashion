import 'package:flutter/material.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:karim_fashion/views/widgets/form_input.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void forgotPassword() {}

  void submitLogin() {
    // TODO: login
    Navigator.pushNamedAndRemoveUntil(context, "/main", (route) => false);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormInput(
          label: "Email / Username",
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        FormInput(
          label: "Password",
          controller: _passwordController,
          obscureText: true,
        ),
        TextButton(
          onPressed: forgotPassword,
          child: const Text(
            "Forgot Password?",
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
        MyButton(
          margin: const EdgeInsets.only(top: 48, bottom: 12),
          minWidth: double.infinity,
          onPressed: submitLogin,
          text: "Masuk",
          textColor: Colors.black,
        ),
      ],
    );
  }
}
