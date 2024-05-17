import 'package:flutter/material.dart';

class FotoProfil extends StatelessWidget {
  const FotoProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: 65,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
        shape: BoxShape.circle,
      ),
      child: const Icon(
        Icons.person_rounded,
        color: Colors.white,
        size: 55,
      ),
    );
  }
}
