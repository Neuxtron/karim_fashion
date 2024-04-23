import 'package:karim_fashion/auth_check.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:karim_fashion/views/main/main_page.dart';
import 'package:karim_fashion/views/signup/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.namaApk,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSwatch(
          backgroundColor: Colors.white,
        ),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const AuthCheck(),
        "/signup": (context) => const SignupPage(),
        "/main": (context) => const MainPage(),
      },
    );
  }
}
