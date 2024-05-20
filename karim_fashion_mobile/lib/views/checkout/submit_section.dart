import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:karim_fashion/utils/app_constants.dart';

class SubmitSection extends StatelessWidget {
  final int totalHarga;
  final Function() onSubmit;
  final bool loading;

  const SubmitSection({
    super.key,
    required this.totalHarga,
    required this.onSubmit,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    final hargaString = NumberFormat("###,###,###").format(totalHarga);

    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Total Pembayaran",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "Rp $hargaString",
                  style: const TextStyle(
                    color: AppConstants.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              height: double.infinity,
              color: loading
                  ? AppConstants.secondary.withOpacity(.5)
                  : AppConstants.secondary,
              child: InkWell(
                onTap: loading ? null : onSubmit,
                child: const Center(
                  child: Text(
                    "Buat Pesanan",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
