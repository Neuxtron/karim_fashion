import 'package:flutter/material.dart';

class UkuranItem extends StatelessWidget {
  final bool active;
  final String text;
  final Function() onPressed;

  const UkuranItem({
    super.key,
    required this.active,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFFAAB9C6);

    return Center(
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: 80,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: active ? bgColor : bgColor.withOpacity(.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
