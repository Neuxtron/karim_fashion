import 'package:karim_fashion/auth_check.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:karim_fashion/view_models/keranjang_view_model.dart';
import 'package:karim_fashion/view_models/produk_view_model.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:karim_fashion/views/checkout/checkout_page.dart';
import 'package:karim_fashion/views/deskripsi/deskripsi_page.dart';
import 'package:karim_fashion/views/info_akun/info_akun_page.dart';
import 'package:karim_fashion/views/keamanan_akun/keamanan_akun_page.dart';
import 'package:karim_fashion/views/keranjang/keranjang_page.dart';
import 'package:karim_fashion/views/main/main_page.dart';
import 'package:karim_fashion/views/signup/signup_page.dart';
import 'package:karim_fashion/views/update_akun/update_akun_page.dart';
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
        ChangeNotifierProvider(create: (context) => UserViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppConstants.namaApk,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Poppins",
          checkboxTheme: CheckboxThemeData(
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return AppConstants.primary;
              }
              return Colors.black26;
            }),
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
          "/checkout": (context) => const CheckoutPage(),
          "/info_akun": (context) => const InfoAkunPage(),
          "/keamanan_akun": (context) => const KeamananAkunPage(),
          "/update_akun": (context) => const UpdateAkunPage(),
        },
      ),
    );
  }
}
