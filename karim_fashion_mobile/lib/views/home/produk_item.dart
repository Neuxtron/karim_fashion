import 'package:flutter/material.dart';
import 'package:karim_fashion/models/produk_model.dart';
import 'package:intl/intl.dart';

class ProdukItem extends StatelessWidget {
  final ProdukModel model;
  const ProdukItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,##,000");
    final harga = formatter.format(model.harga);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                      color: Colors.black.withOpacity(.3),
                    ),
                  ],
                ),
                child: Image.network(model.gambar, fit: BoxFit.cover),
              ),
            ),
            Text(model.nama),
            Text(
              "Rp $harga",
              style: const TextStyle(color: Color(0xFFFF4A4A)),
            ),
          ],
        ),
      ),
    );
  }
}
