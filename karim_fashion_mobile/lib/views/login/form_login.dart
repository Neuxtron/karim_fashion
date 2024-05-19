import 'package:flutter/material.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:karim_fashion/views/widgets/form_input.dart';
import 'package:provider/provider.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => FormLoginState();
}

class FormLoginState extends State<FormLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;
  String _error = "";

  void forgotPassword() {}

  void submitLogin() {
    setState(() {
      _loading = true;
      _error = "";
    });
    final nama = _emailController.text.trim();
    final password = _passwordController.text;
    context.read<UserViewModel>().login(nama, password).then((error) {
      setState(() {
        _loading = false;
        _error = error;
      });
    });
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
        Center(
          child: Text(
            _error,
            style: const TextStyle(color: Colors.red),
          ),
        ),
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
          loading: _loading,
        ),
      ],
    );
  }
}
