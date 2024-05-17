import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/info_akun/info_item.dart';
import 'package:provider/provider.dart';

class InfoAkunPage extends StatelessWidget {
  const InfoAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Informasi Akun",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        foregroundColor: AppConstants.primary,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: InfoItem(
              label: "Username",
              value: user.username,
            ),
          ),
          InfoItem(
            label: "Email",
            value: user.email,
          ),
          InfoItem(
            label: "No HP",
            value: user.hp,
          ),
        ],
      ),
    );
  }
}
