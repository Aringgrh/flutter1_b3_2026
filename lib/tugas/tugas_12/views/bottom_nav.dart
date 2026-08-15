import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/home/home.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/pesanan.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/profile.dart';
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

  final List<Widget> pages = [
    HomeFodos(),
    HalamanPencarianFodos(),
    PesananTugas12(),
    ProfileTugas12(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        rippleColor: AppColors.secondary,
        onTabChange: (value) {
          changeBottom(value);
        },
        selectedIndex: pilihan,
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            iconActiveColor: Colors.white,
            text: ("Beranda"),
            textColor: Colors.white,
            backgroundColor: AppColors.secondary,
          ),
          GButton(
            icon: Icons.search,
            iconActiveColor: Colors.white,
            text: ("Pencarian"),
            textColor: Colors.white,
            backgroundColor: AppColors.secondary,
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            iconActiveColor: Colors.white,
            text: ("Pesanan"),
            textColor: Colors.white,
            backgroundColor: AppColors.secondary,
          ),
          GButton(
            icon: Icons.person_outline,
            iconActiveColor: Colors.white,
            text: ("Profil"),
            textColor: Colors.white,
            backgroundColor: AppColors.secondary,
          ),
        ],
      ),
      body: pages.elementAt(pilihan),
    );
  }
}
