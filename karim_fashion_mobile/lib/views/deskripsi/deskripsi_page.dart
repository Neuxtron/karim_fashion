import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/produk_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/views/deskripsi/popup_keranjang.dart';

class DeskripsiPage extends StatelessWidget {
  const DeskripsiPage({super.key});

  void masukkanKeranjang(BuildContext context, ProdukModel produk) {
    showDialog(
      context: context,
      builder: (context) {
        return PopupKeranjang(
          produk: produk,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final produk = ModalRoute.of(context)!.settings.arguments as ProdukModel;
    final hargaString = NumberFormat("###,###,###").format(produk.harga);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Image.network(
                    produk.gambar,
                    height: 180,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rp $hargaString",
                        style: const TextStyle(color: AppConstants.danger),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(produk.nama),
                      ),
                      Text("${produk.terjual} Terjual"),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Deskripsi",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(produk.deskripsi),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Expanded(child: SizedBox()),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        color: AppConstants.secondary.withOpacity(.6),
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PopupKeranjang(produk: produk);
                              },
                            );
                          },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                "Maskkan keranjang",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        color: AppConstants.secondary,
                        child: InkWell(
                          onTap: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Checkout dengan harga",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "Rp$hargaString",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
