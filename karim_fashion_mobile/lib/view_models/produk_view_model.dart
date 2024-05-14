import 'package:flutter/material.dart';
import 'package:karim_fashion/models/produk_model.dart';

class ProdukViewModel extends ChangeNotifier {
  List<ProdukModel> _listProduk = [
    ProdukModel(
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
    ProdukModel(
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
    ProdukModel(
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
    ProdukModel(
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
  ];
  List<ProdukModel> get listProduk => _listProduk;
}
