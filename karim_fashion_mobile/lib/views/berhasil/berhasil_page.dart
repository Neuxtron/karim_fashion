import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:provider/provider.dart';

class BerhasilPage extends StatelessWidget {
  const BerhasilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final total = ModalRoute.of(context)!.settings.arguments as int;

    final expire = DateTime.now().add(const Duration(days: 1));
    final expireString = DateFormat("dd/MM/yyyy hh:mm").format(expire);
    final user = context.read<UserViewModel>().currentUser;

    final totalString = NumberFormat("###,###,###").format(total + user!.id!);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Icon(Icons.history_rounded, size: 60),
                      const Text(
                        "Menunggu pembayaran...",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      const Text("Silahkan bayar sebelum: "),
                      Text(
                        expireString,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  "Rekening tujuan:",
                ),
                const Text(
                  AppConstants.rekening,
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Jumlah bayar:",
                  style: TextStyle(fontSize: 16),
                ),
                Stack(
                  children: [
                    const Positioned(
                      right: 0,
                      child: ColoredBox(
                        color: Color(0xFFffc107),
                        child: Text(
                          "000",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Rp$totalString",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Center(
                  child: MyButton(
                    onPressed: () => Navigator.pop(context),
                    margin: const EdgeInsets.only(top: 50),
                    color: AppConstants.primary,
                    text: "Kembali",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
