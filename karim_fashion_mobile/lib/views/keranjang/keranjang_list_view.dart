import 'package:flutter/material.dart';
import 'package:karim_fashion/models/keranjang_model.dart';

import 'keranjang_item.dart';

class KeranjangListView extends StatelessWidget {
  final List<KeranjangModel> listKeranjang;
  final Function(int index, bool isChecked, int amount) updateKeranjang;
  final bool loading;

  const KeranjangListView({
    super.key,
    required this.listKeranjang,
    required this.updateKeranjang,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }

    return Expanded(
      child: ListView.builder(
        itemCount: listKeranjang.length,
        itemBuilder: (context, index) {
          final keranjang = listKeranjang[index];
          return KeranjangItem(
            keranjang: keranjang,
            index: index,
            updateKeranjang: updateKeranjang,
          );
        },
      ),
    );
  }
}
