import 'package:flutter/material.dart';

class KategroriItem extends StatelessWidget {
  final bool active;
  final String text;
  final Function()? onTap;

  const KategroriItem({
    super.key,
    this.active = false,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 7),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF55728E) : const Color(0xFFCCD5DD),
          borderRadius: BorderRadius.circular(999),
        ),
        child: InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
