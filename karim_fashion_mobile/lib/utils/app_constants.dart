import 'package:flutter/material.dart';

class AppConstants {
  static const namaApk = "Karim Fashion";
  static const logoApk = "assets/images/logo.png";

  static const secondary = Color(0xFFF2994A);
  static const primary = Color(0xFF002C55);
  static const danger = Color(0xFFFF4A4A);

  static const baseUrl = "http://192.168.43.135:3000";
  static const rekening = "7171717"; // TODO: rekening
  static String? token;
}

enum ServerStatus { normal, loading, error }
