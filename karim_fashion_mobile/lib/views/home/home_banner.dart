import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String value) onChanged;
  const HomeBanner({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              "assets/images/cod.png",
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
            Image.asset(
              "assets/images/splash.png",
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
            Image.asset(
              "assets/images/banner_3.png",
              width: double.infinity,
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            disableCenter: true,
            aspectRatio: 16 / 9, // Adjust this to fit your design
          ),
        ),
      ],
    );
  }
}
