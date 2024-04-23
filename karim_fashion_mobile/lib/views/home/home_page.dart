import 'package:flutter/material.dart';
import 'package:karim_fashion/models/kategori_model.dart';
import 'package:karim_fashion/models/produk_model.dart';
import 'package:karim_fashion/views/home/home_kategori.dart';
import 'package:karim_fashion/views/home/home_search.dart';
import 'package:karim_fashion/views/home/produk_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();
  final List<KategoriModel> _listKategori = [
    KategoriModel(id: 0, nama: "Semua"),
    KategoriModel(id: 1, nama: "Pakaian Bayi"),
    KategoriModel(id: 2, nama: "Pakaian Wanita"),
    KategoriModel(id: 3, nama: "Pakaian Pria"),
    KategoriModel(id: 4, nama: "Sendal & Sepatu"),
  ];
  final List<ProdukModel> _listProduk = [
    ProdukModel(
      gambar:
          "https://down-id.img.susercontent.com/file/d7888db00ee2bb35f0fc7644a967f0b4",
      nama: "Baju Tidur Bayi",
      harga: 50000,
    ),
    ProdukModel(
      gambar:
          "https://down-id.img.susercontent.com/file/d7888db00ee2bb35f0fc7644a967f0b4",
      nama: "Baju Tidur Bayi",
      harga: 50000,
    ),
    ProdukModel(
      gambar:
          "https://down-id.img.susercontent.com/file/d7888db00ee2bb35f0fc7644a967f0b4",
      nama: "Baju Tidur Bayi",
      harga: 50000,
    ),
    ProdukModel(
      gambar:
          "https://down-id.img.susercontent.com/file/d7888db00ee2bb35f0fc7644a967f0b4",
      nama: "Baju Tidur Bayi",
      harga: 50000,
    ),
  ];

  int _activeKategori = 0;

  void search() {}

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HomeSearch(
            controller: _searchController,
            onSearch: search,
          ),
          HomeKategori(
            listKategori: _listKategori,
            activeKategori: _activeKategori,
            onTap: (kategori) => setState(() => _activeKategori = kategori),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 6 / 9,
              mainAxisSpacing: 40,
            ),
            itemCount: _listProduk.length,
            itemBuilder: (context, index) {
              final model = _listProduk[index];
              return ProdukItem(model: model);
            },
          ),
        ],
      ),
    );
  }
}
