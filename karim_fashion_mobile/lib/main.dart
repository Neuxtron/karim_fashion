import 'package:karim_fashion/auth_check.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:karim_fashion/view_models/keranjang_view_model.dart';
import 'package:karim_fashion/view_models/produk_view_model.dart';
import 'package:karim_fashion/views/deskripsi/deskripsi_page.dart';
import 'package:karim_fashion/views/keranjang/keranjang_page.dart';
import 'package:karim_fashion/views/main/main_page.dart';
import 'package:karim_fashion/views/signup/signup_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProdukViewModel()),
        ChangeNotifierProvider(create: (context) => KeranjangViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.namaApk,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStatePropertyAll(Colors.black26),
          ),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: Colors.white,
          ),
        ),
        initialRoute: "/",
        routes: {
          "/": (context) => const AuthCheck(),
          "/signup": (context) => const SignupPage(),
          "/main": (context) => const MainPage(),
          "/deskripsi": (context) => const DeskripsiPage(),
          "/keranjang": (context) => const KeranjangPage(),
        },
      ),
    );
  }
}
