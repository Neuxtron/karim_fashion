import 'package:flutter/material.dart';

class FotoProfil extends StatelessWidget {
  final String url;
  const FotoProfil({super.key, required this.url});

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
      child: Image.network(
        url,
        height: 65,
        width: 65,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.person_rounded,
            color: Colors.white,
            size: 55,
          );
        },
      ),
    );
  }
}
