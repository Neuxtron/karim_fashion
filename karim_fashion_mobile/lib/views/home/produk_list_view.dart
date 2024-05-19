import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/produk_view_model.dart';
import 'package:provider/provider.dart';

import 'produk_item.dart';

class ProdukListView extends StatelessWidget {
  final int? activeKategori;
  final String searchText;

  const ProdukListView({
    super.key,
    required this.searchText,
    required this.activeKategori,
  });

  @override
  Widget build(BuildContext context) {
    final listProduk = context.watch<ProdukViewModel>().listProduk;
    final status = context.watch<ProdukViewModel>().status;

    final searchList = listProduk.where((produk) {
      final searchLower = searchText.toLowerCase();
      final namaLower = produk.nama.toLowerCase();
      return namaLower.contains(searchLower);
    }).toList();
    final kategoriList = searchList.where((produk) {
      return produk.idKategori == activeKategori || activeKategori == null;
    }).toList();

    if (status == ServerStatus.loading) {
      return const CircularProgressIndicator();
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 6 / 9,
        mainAxisSpacing: 40,
      ),
      itemCount: kategoriList.length,
      itemBuilder: (context, index) {
        final model = kategoriList[index];
        return ProdukItem(model: model);
      },
    );
  }
}
