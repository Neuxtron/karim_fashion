import 'package:flutter/material.dart';

class PasswordItem extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;

  const PasswordItem({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<PasswordItem> createState() => _PasswordItemState();
}

class _PasswordItemState extends State<PasswordItem> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: !_showPassword,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: Colors.grey,
                ),
                enabledBorder: buildBorder(),
                focusedBorder: buildBorder(),
              ),
            ),
          ),
          IconButton(
            onPressed: () => setState(() => _showPassword = !_showPassword),
            iconSize: 30,
            icon: Icon(
              _showPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
          ),
        ],
      ),
    );
  }

  InputBorder buildBorder() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
    );
  }
}
