import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/views/login/konten_login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.primary,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppConstants.primary,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 60),
              Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: double.infinity,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: const KontenLogin(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
