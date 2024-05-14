class ProdukModel {
  final String gambar;
  final String nama;
  final int harga;
  final int terjual;
  final int stok;
  final int idKategori;
  // TODO: list ukuran
  // final List<String> listUkuran;
  final String deskripsi;

  ProdukModel({
    required this.gambar,
    required this.nama,
    required this.harga,
    required this.terjual,
    required this.stok,
    required this.idKategori,
    // required this.listUkuran,
    required this.deskripsi,
  });
}
