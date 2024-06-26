import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final bool multiline;

  const FormInput({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.hintText,
    this.obscureText = false,
    this.multiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 5),
          child: Text(label),
        ),
        TextField(
          controller: controller,
          keyboardType: multiline ? TextInputType.multiline : keyboardType,
          style: const TextStyle(fontSize: 14),
          obscureText: obscureText,
          cursorColor: AppConstants.primary,
          minLines: multiline ? 4 : 1,
          maxLines: multiline ? 4 : 1,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),
            hintText: hintText ?? "Masukkan $label",
            hintStyle: const TextStyle(color: Colors.grey),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
        ),
      ],
    );
  }

  InputBorder buildBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xFFCCCDCE)),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
