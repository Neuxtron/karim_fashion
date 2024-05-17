import 'package:flutter/material.dart';

class KecamatanDropdown extends StatelessWidget {
  final Function(int? value) onChange;
  final int value;

  const KecamatanDropdown({
    super.key,
    required this.onChange,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 20, bottom: 5),
          child: Text("Kecamatan"),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFCCCDCE)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              value: value,
              isExpanded: true,
              borderRadius: BorderRadius.circular(8),
              onChanged: onChange,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text("One"),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text("Two"),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text("Three"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
