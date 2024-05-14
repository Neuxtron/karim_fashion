import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/views/widgets/my_search_input.dart';

class HomeSearch extends StatelessWidget {
  final TextEditingController controller;
  final Function() onSearch;

  const HomeSearch({
    super.key,
    required this.controller,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MySearchInput(
            controller: controller,
            hintText: "Search...",
            onSubmit: onSearch,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppConstants.primary,
            borderRadius: BorderRadius.circular(999),
          ),
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: onSearch,
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
        const SizedBox(width: 16), //----- Jarak
      ],
    );
  }
}
