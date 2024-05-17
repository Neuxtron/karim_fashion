import 'package:flutter/material.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/views/checkout/keranjang_item.dart';

class KeranjangSection extends StatelessWidget {
  final List<KeranjangModel> listKeranjang;
  const KeranjangSection({super.key, required this.listKeranjang});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listKeranjang.length,
      itemBuilder: (context, index) {
        final keranjang = listKeranjang[index];
        return KeranjangItem(keranjang: keranjang);
      },
    );
  }
}
