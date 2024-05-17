import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/keranjang_model.dart';

class KeranjangItem extends StatelessWidget {
  final KeranjangModel keranjang;
  const KeranjangItem({super.key, required this.keranjang});

  @override
  Widget build(BuildContext context) {
    final hargaString =
        NumberFormat("###,###,###").format(keranjang.produk.harga);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            keranjang.produk.gambar,
            height: 80,
            width: 100,
          ),
          Stack(
            children: [
              SizedBox(
                height: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(keranjang.produk.nama),
                    Text(
                      "Variasi: ${keranjang.ukuran}",
                      style: TextStyle(color: Colors.black54),
                    ),
                    Text("Rp $hargaString"),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Text(
                  "x${keranjang.amount}",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
