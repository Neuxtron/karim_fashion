import 'package:flutter/material.dart';
import 'package:karim_fashion/view_models/kategori_view_model.dart';
import 'package:karim_fashion/view_models/produk_view_model.dart';
import 'package:karim_fashion/views/home/home_kategori.dart';
import 'package:karim_fashion/views/home/home_search.dart';
import 'package:karim_fashion/views/home/produk_list_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  int? _activeKategori;
  String _searchText = "";

  void getData() {
    context.read<KategoriViewModel>().getKategori();
    context.read<ProdukViewModel>().getProduk();
  }

  void updateKategori(int kategori) {
    if (_activeKategori != kategori) {
      setState(() => _activeKategori = kategori);
    } else {
      setState(() => _activeKategori = null);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
            onSearch: () {
              setState(() => _searchText = _searchController.text);
            },
          ),
          HomeKategori(
            activeKategori: _activeKategori,
            onTap: updateKategori,
          ),
          ProdukListView(
            searchText: _searchText,
            activeKategori: _activeKategori,
          ),
        ],
      ),
    );
  }
}
