import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class MySearchInput extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry margin;
  final Function()? onSubmit;

  const MySearchInput({
    super.key,
    this.keyboardType,
    this.onSubmit,
    required this.hintText,
    required this.controller,
    this.margin = const EdgeInsets.symmetric(vertical: 5),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(fontSize: 14),
        cursorColor: AppConstants.primary,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  InputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(999),
    );
  }
}
