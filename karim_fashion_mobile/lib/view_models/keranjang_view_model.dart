import 'package:flutter/material.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/models/produk_model.dart';

class KeranjangViewModel extends ChangeNotifier {
  List<KeranjangModel> _listKeranjang = [
    KeranjangModel(
      produk: ProdukModel(
        gambar:
            "https://www.portalindonesia.co.id/wp-content/uploads/2020/02/Baju-Bayi-Libby-3.jpg",
        nama: "Baju Tidur Bayi",
        harga: 50000,
        terjual: 12,
        stok: 35,
        idKategori: 1,
        deskripsi:
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt sed commodi, aliquam placeat autem minima voluptatem culpa ex voluptatibus cumque, at eius. Eligendi error sed officia quidem! Iste culpa tempora magni cupiditate?",
      ),
    ),
    KeranjangModel(
      produk: ProdukModel(
        gambar:
            "https://www.portalindonesia.co.id/wp-content/uploads/2020/02/Baju-Bayi-Libby-3.jpg",
        nama: "Baju Tidur Bayi",
        harga: 50000,
        terjual: 12,
        stok: 35,
        idKategori: 1,
        deskripsi:
            "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Deserunt sed commodi, aliquam placeat autem minima voluptatem culpa ex voluptatibus cumque, at eius. Eligendi error sed officia quidem! Iste culpa tempora magni cupiditate?",
      ),
    ),
  ];

  List<KeranjangModel> get listKeranjang => _listKeranjang;
}
