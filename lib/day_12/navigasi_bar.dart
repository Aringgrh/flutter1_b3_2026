import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_12/beranda_coba.dart';
import 'package:flutter1_b3_2026/day_12/search_coba.dart';
import 'package:flutter1_b3_2026/tugas/tugas_3_flutter.dart';
import 'package:flutter1_b3_2026/tugas/tugas_5_flutter.dart';

class NavigasiBar extends StatefulWidget {
  const NavigasiBar({super.key});

  @override
  State<NavigasiBar> createState() => _NavigasiBarState();
}

int currenIndex = 0;
final List<Widget> pages = [
  BerandaCoba(),
  SearchCoba(),
  Tugas5Flutter(),
  Tugas3Flutter(),
];

class _NavigasiBarState extends State<NavigasiBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Belajar Navigasi Bar"),
      //   backgroundColor: Colors.cyan,
      //   centerTitle: true,
      // ),
      body: pages[currenIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currenIndex,
        onDestinationSelected: (index) {
          setState(() {
            currenIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Beranda",
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: "Cari",
          ),
          NavigationDestination(
            icon: Icon(Icons.trolley),
            selectedIcon: Icon(Icons.trolley),
            label: "Pesanan",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            selectedIcon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}
