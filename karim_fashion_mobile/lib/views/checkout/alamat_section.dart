import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

class AlamatSection extends StatelessWidget {
  const AlamatSection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<UserViewModel>().currentUser;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SvgPicture.asset(
                "assets/icons/ic_lokasi.svg",
                height: 30,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Alamat Pengiriman"),
                  Text(
                    "${user.username} | ${user.hp}",
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    user.alamat,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          width: double.infinity,
          child: Text(
            "Lorem ipsum dolor sit amet consectetur, adipisicing elit. Saepe qui deleniti atque tenetur voluptatum amet incidunt? Illo labore exercitationem magnam minus iure veniam eius deleniti iusto reiciendis maxime dignissimos, tempore asperiores animi rem inventore consequatur, nisi accusamus nesciunt alias necessitatibus? Ipsam autem quisquam voluptates delectus distinctio? Sapiente dolorem veritatis fuga maiores distinctio. Quae in vero dolor totam debitis, ipsa itaque explicabo culpa iste nostrum neque dicta iusto voluptatum magni recusandae ad fuga amet placeat ut odit perferendis voluptates! Magni necessitatibus consectetur quod quo unde iste voluptatem illo enim. Dignissimos aspernatur reprehenderit commodi eum dolores suscipit, neque adipisci ut enim repellat.",
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
              decorationColor: AppConstants.primary,
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
