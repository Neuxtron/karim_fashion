import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/models/produk_model.dart';
import 'package:karim_fashion/models/stok_model.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/keranjang_view_model.dart';
import 'package:karim_fashion/views/deskripsi/ukuran_item.dart';
import 'package:karim_fashion/views/widgets/my_button.dart';
import 'package:provider/provider.dart';

class PopupKeranjang extends StatefulWidget {
  final ProdukModel produk;
  final bool langsungCheckout;

  const PopupKeranjang({
    super.key,
    required this.produk,
    required this.langsungCheckout,
  });

  @override
  State<PopupKeranjang> createState() => _PopupKeranjangState();
}

class _PopupKeranjangState extends State<PopupKeranjang> {
  String get _hargaString =>
      NumberFormat("###,###,###").format(widget.produk.harga);
  List<StokModel> get _listUkuran => widget.produk.listUkuran;

  int _indexUkuran = 0;
  int _jumlah = 1;

  void submitKeranjang() {
    final keranjang = KeranjangModel(
      produk: widget.produk,
      ukuran: _listUkuran[_indexUkuran],
      amount: _jumlah,
    );
    if (widget.langsungCheckout) {
      Navigator.pushNamed(context, "/checkout", arguments: [keranjang])
          .then((_) {
        Navigator.pop(context);
      });
      return;
    }
    context
        .read<KeranjangViewModel>()
        .updateKeranjang(keranjang: keranjang)
        .then((_) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  children: [
                    Image.network(
                      widget.produk.gambar,
                      height: 80,
                      width: 100,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp$_hargaString",
                            style: const TextStyle(
                              color: AppConstants.danger,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Stok: ${_listUkuran[_indexUkuran].stok}",
                            style: const TextStyle(
                                color: Colors.black38, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("UKURAN"),
                    SizedBox(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listUkuran.length,
                        itemBuilder: (context, index) {
                          final ukuran = _listUkuran[index];
                          return UkuranItem(
                            active: _indexUkuran == index,
                            text: ukuran.nama,
                            onPressed: () {
                              setState(() => _indexUkuran = index);
                            },
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                ),
                child: Row(
                  children: [
                    const Text("Jumlah"),
                    const Expanded(child: SizedBox()),
                    Container(
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                            child: InkWell(
                              onTap: () {
                                if (_jumlah > 1) {
                                  setState(() => _jumlah--);
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
                                _jumlah.toString(),
                                style:
                                    const TextStyle(color: AppConstants.danger),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 30,
                            child: InkWell(
                              onTap: () => setState(() => _jumlah++),
                              child: const Icon(Icons.add),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              MyButton(
                onPressed: submitKeranjang,
                margin: const EdgeInsets.all(12),
                minWidth: double.infinity,
                text: widget.langsungCheckout
                    ? "Beli Sekarang"
                    : "Masukkan Keranjang",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
