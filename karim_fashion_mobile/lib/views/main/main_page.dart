import 'package:flutter/material.dart';
import 'package:karim_fashion/utils/app_constants.dart';
import 'package:karim_fashion/views/akun/akun_page.dart';
import 'package:karim_fashion/views/home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currIndex = 0;

  final _pages = const [
    HomePage(),
    AkunPage(),
  ];

  final List<BottomNavigationBarItem> _navItems = const [
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.home_rounded),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.person_rounded),
    ),
    BottomNavigationBarItem(
      label: "",
      icon: Icon(Icons.shopping_cart_rounded),
    ),
  ];

  final _appBars = [
    AppBar(
      backgroundColor: AppConstants.primary,
      foregroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/logo.png",
            height: 30,
          ),
          const SizedBox(width: 10),
          const Text(
            "Karim Fashion",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    ),
    AppBar(
      title: const Text(
        "Akun Saya",
        style: TextStyle(fontSize: 18),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_currIndex],
      body: _pages[_currIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _currIndex,
        onTap: (index) {
          if (index == 2) {
            Navigator.pushNamed(context, "/keranjang");
            return;
          }
          setState(() => _currIndex = index);
        },
        selectedItemColor: AppConstants.primary,
        unselectedItemColor: const Color(0xFFAAB9C6),
        iconSize: 40,
      ),
    );
  }
}
