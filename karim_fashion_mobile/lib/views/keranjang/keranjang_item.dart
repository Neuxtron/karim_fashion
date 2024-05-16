import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class KeranjangItem extends StatelessWidget {
  final KeranjangModel keranjang;
  final Function(int index, bool isChecked, int amount) updateKeranjang;
  final int index;

  const KeranjangItem({
    super.key,
    required this.keranjang,
    required this.updateKeranjang,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final total = keranjang.amount * keranjang.produk.harga;
    final hargaString = NumberFormat('###,###,###').format(total);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Checkbox(
            value: keranjang.isChecked,
            onChanged: (value) {
              updateKeranjang(
                index,
                !keranjang.isChecked,
                keranjang.amount,
              );
            },
          ),
          Image.network(
            keranjang.produk.gambar,
            height: 90,
            width: 110,
          ),
          SizedBox(
            height: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(keranjang.produk.nama),
                Container(
                  color: const Color(0xFFEDEDED),
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Variasi: ${keranjang.ukuran}",
                    style: const TextStyle(color: Color(0xFF7C7C7C)),
                  ),
                ),
                Text(
                  "Rp$hargaString",
                  style: const TextStyle(
                    color: AppConstants.danger,
                  ),
                ),
                Container(
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            if (keranjang.amount > 1) {
                              updateKeranjang(
                                index,
                                keranjang.isChecked,
                                --keranjang.amount,
                              );
                            }
                          },
                          child: const Icon(Icons.remove),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: double.infinity,
                        decoration: const BoxDecoration(
                          border: Border.symmetric(
                            vertical: BorderSide(color: Colors.black26),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            keranjang.amount.toString(),
                            style: const TextStyle(color: AppConstants.danger),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                        child: InkWell(
                          onTap: () {
                            updateKeranjang(
                              index,
                              keranjang.isChecked,
                              ++keranjang.amount,
                            );
                          },
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
