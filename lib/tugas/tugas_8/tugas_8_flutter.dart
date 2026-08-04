import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/tugas_7_flutter.dart';
import 'package:flutter1_b3_2026/tugas/tugas_8/profil.dart';

class Tugas8Flutter extends StatefulWidget {
  const Tugas8Flutter({super.key});

  @override
  State<Tugas8Flutter> createState() => _Tugas8FlutterState();
}

class _Tugas8FlutterState extends State<Tugas8Flutter> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    _selectedBottom = index;
    setState(() {});
  }

  final List<Widget> _widgetOption = [Tugas7Flutter(), ProfilTugas8()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBarPro(
        barHeight: 80,
        fabSink: 10,
        fabGap: 5,
        cornerRadius: 10,
        activeColor: Colors.cyan,
        notchShoulderRadius: 30,
        contentPadding: 10,
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          CurvedNavigationItemPro(
            inactiveIcon: Icons.home_outlined,

            activeIcon: Icons.home_rounded,
            label: "Beranda",
          ),
          CurvedNavigationItemPro(
            inactiveIcon: Icons.error_outline,
            activeIcon: Icons.error_rounded,
            label: "Tentang Kami",
          ),
        ],
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
