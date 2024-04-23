import 'package:flutter/material.dart';
import 'package:karim_fashion/views/login/form_login.dart';

class KontenLogin extends StatelessWidget {
  const KontenLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Login",
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 32),
        const FormLogin(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
            InkWell(
              onTap: () => Navigator.pushNamed(context, "/signup"),
              child: const Text(
                "Register Now",
                style: TextStyle(
                  color: Color(0xFF0C8CE9),
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 64), //----- Jarak
          ],
        )
      ],
    );
  }
}
