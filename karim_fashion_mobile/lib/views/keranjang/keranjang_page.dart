import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/keranjang_view_model.dart';
import 'package:karim_fashion/views/keranjang/keranjang_list_view.dart';
import 'package:provider/provider.dart';

class KeranjangPage extends StatefulWidget {
  const KeranjangPage({super.key});

  @override
  State<KeranjangPage> createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  bool _semua = false;
  bool _loading = false;

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

  List<KeranjangModel> get _listOrder {
    final List<KeranjangModel> listOrder = [];

    for (var keranjang in _listKeranjang) {
      if (keranjang.isChecked) listOrder.add(keranjang);
    }

    return listOrder;
  }

  String get _totalString => NumberFormat('###,###,###').format(_total);

  void updateKeranjang(int index, bool isChecked, int amount) {
    if (!isChecked) _semua = false;
    _listKeranjang[index].isChecked = isChecked;
    _listKeranjang[index].amount = amount;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<KeranjangViewModel>().getKeranjang();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang Saya"),
      ),
      body: Column(
        children: [
          KeranjangListView(
            updateKeranjang: updateKeranjang,
            loading: _loading,
          ),
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
                        value: _semua,
                        onChanged: (value) {
                          _semua = !_semua;
                          for (var trolley in _listKeranjang) {
                            final index = _listKeranjang.indexOf(trolley);
                            _listKeranjang[index].isChecked = _semua;
                            setState(() {});
                          }
                        },
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
                    child: InkWell(
                      onTap: () {
                        if (_listOrder.isEmpty) return;
                        Navigator.pushNamed(
                          context,
                          "/checkout",
                          arguments: _listOrder,
                        );
                      },
                      child: Center(
                        child: Text(
                          "Checkout (${_listOrder.length})",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
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
