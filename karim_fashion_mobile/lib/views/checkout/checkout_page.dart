import 'package:flutter/material.dart';
import 'package:karim_fashion/models/keranjang_model.dart';
import 'package:karim_fashion/models/order_model.dart';
import 'package:karim_fashion/models/pembayaran_model.dart';
import 'package:karim_fashion/view_models/daerah_view_model.dart';
import 'package:karim_fashion/view_models/order_view_model.dart';
import 'package:karim_fashion/views/checkout/alamat_section.dart';
import 'package:karim_fashion/views/checkout/keranjang_section.dart';
import 'package:karim_fashion/views/checkout/metode_bayar_section.dart';
import 'package:karim_fashion/views/checkout/pengiriman_section.dart';
import 'package:karim_fashion/views/checkout/rincian_section.dart';
import 'package:karim_fashion/views/checkout/submit_section.dart';
import 'package:karim_fashion/views/checkout/total_pesanan_section.dart';
import 'package:provider/provider.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _listPembayaran = [
    PembayaranModel(
      gambar: "assets/images/cod.png",
      text: "COD",
    ),
    PembayaranModel(
      gambar: "assets/images/transfer_bank.png",
      text: "Transfer Bank",
    ),
  ];

  int _indexPembayaran = 0;
  bool _loading = true;

  int? get _ongkir => context.watch<DaerahViewModel>().ongkir;

  void submitPesanan(List<KeranjangModel> listKeranjang, int totalHarga) {
    final ongkir = context.read<DaerahViewModel>().ongkir;
    if (ongkir == null) return;
    setState(() => _loading = true);

    final pembayaran = _listPembayaran[_indexPembayaran];
    final order = OrderModel(
      metodeBayar: pembayaran,
      ongkir: ongkir,
    );

    context
        .read<OrderViewModel>()
        .createOrder(order, listKeranjang)
        .then((value) {
      setState(() => _loading = false);
      if (pembayaran.text == "COD") {
        Navigator.pop(context);
      } else {
        Navigator.pushNamed(
          context,
          "/berhasil",
          arguments: totalHarga + ongkir,
        ).then((_) => Navigator.pop(context));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<DaerahViewModel>().getOngkir().then((value) {
      setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listKeranjang =
        ModalRoute.of(context)!.settings.arguments as List<KeranjangModel>;

    int totalHarga = 0;
    for (var keranjang in listKeranjang) {
      totalHarga += keranjang.produk.harga * keranjang.amount;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AlamatSection(),
            KeranjangSection(listKeranjang: listKeranjang),
            PengirimanSection(ongkir: _ongkir),
            TotalPesananSection(
              totalProduk: listKeranjang.length,
              totalHarga: totalHarga,
            ),
            MetodeBayarSection(
              listPembayaran: _listPembayaran,
              activeIndex: _indexPembayaran,
              onChange: (index) => setState(() => _indexPembayaran = index),
            ),
            RincianSection(
              totalHarga: totalHarga,
              ongkir: _ongkir,
            ),
            SubmitSection(
              totalHarga: totalHarga,
              loading: _loading,
              onSubmit: () => submitPesanan(listKeranjang, totalHarga),
            ),
          ],
        ),
      ),
    );
  }
}
