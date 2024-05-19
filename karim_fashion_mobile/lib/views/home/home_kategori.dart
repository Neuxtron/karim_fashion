import 'package:flutter/material.dart';
import 'package:karim_fashion/view_models/kategori_view_model.dart';
import 'package:karim_fashion/views/home/kategori_item.dart';
import 'package:provider/provider.dart';

class HomeKategori extends StatelessWidget {
  final int? activeKategori;
  final Function(int kategori) onTap;

  const HomeKategori({
    super.key,
    required this.activeKategori,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final listKategori = context.watch<KategoriViewModel>().listKategori;

    return SizedBox(
      height: 50,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: listKategori.length,
        itemBuilder: (context, index) {
          final kategori = listKategori[index];
          final active = kategori.id == activeKategori;

          return KategroriItem(
            text: kategori.nama,
            active: active,
            onTap: () => onTap(kategori.id),
          );
        },
      ),
    );
  }
}
