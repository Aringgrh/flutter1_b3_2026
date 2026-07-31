import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MotionTab extends StatefulWidget {
  const MotionTab({super.key});

  @override
  State<MotionTab> createState() => _MotionTabState();
}

class _MotionTabState extends State<MotionTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        tabs: [
          GButton(
            icon: Icons.home_outlined,
            text: ("Beranda"),
            backgroundColor: Colors.cyan,
          ),
          GButton(
            icon: Icons.search,
            text: ("Pencarian"),
            backgroundColor: Colors.cyan,
          ),
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: ("Pesanan"),
            backgroundColor: Colors.cyan,
          ),
          GButton(
            icon: Icons.person_outline,
            text: ("Profil"),
            backgroundColor: Colors.cyan,
          ),
        ],
      ),
    );
  }
}
