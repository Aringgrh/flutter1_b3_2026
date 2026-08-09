import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/beranda.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavTugas12 extends StatefulWidget {
  const BottomNavTugas12({super.key});

  @override
  State<BottomNavTugas12> createState() => _BottomNavTugas12State();
}

class _BottomNavTugas12State extends State<BottomNavTugas12> {
  int pilihan = 0;
  void changeBottom(int index) {
    pilihan = index;
    setState(() {});
  }

  final List<Widget> pages = [BerandaTugas12(), PencarianTugas12()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        onTabChange: (value) {
          changeBottom(value);
        },
        selectedIndex: pilihan,
        tabs: [
          GButton(icon: Icons.home_outlined, text: ("Beranda"), backgroundColor: Colors.cyan),
          GButton(icon: Icons.search, text: ("Pencarian"), backgroundColor: Colors.cyan),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: ("Pesanan"),
            backgroundColor: Colors.cyan,
          ),
          GButton(icon: Icons.person_outline, text: ("Profil"), backgroundColor: Colors.cyan),
        ],
      ),
      body: pages.elementAt(pilihan),
    );
  }
}
