import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/keranjang_view_model.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  List<KeranjangModel> get _listKeranjang =>
      context.read<KeranjangViewModel>().listKeranjang;

  int get _total {
    int total = 0;
    for (var keranjang in _listKeranjang) {
      if (keranjang.isChecked) {
        total += keranjang.produk.harga * keranjang.amount;
      }
    }
    return total;
  }

  String get _totalString => NumberFormat('###,###,###').format(_total);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Saya"),
      ),
      body: Stack(
        children: [
          // ListView.builder(
          //   itemBuilder: itemBuilder,
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text(
                            "Semua",
                            style: TextStyle(color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Total ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          Text(
                            "Rp$_totalString",
                            style: const TextStyle(
                              color: AppConstants.danger,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        color: AppConstants.secondary,
                        child: Center(
                          child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Checkout (${_listKeranjang.length})",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
