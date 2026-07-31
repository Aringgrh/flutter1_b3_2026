import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_13/bussines.dart';
import 'package:flutter1_b3_2026/day_13/drawer.dart';
import 'package:flutter1_b3_2026/day_13/school.dart';

class BottomNavDay13 extends StatefulWidget {
  const BottomNavDay13({super.key});

  @override
  State<BottomNavDay13> createState() => _BottomNavDay13State();
}

class _BottomNavDay13State extends State<BottomNavDay13> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini Adalah value dari $_selectedBottom");
    setState(() {});
  }

  final List<Widget> _widgetOption = [
    DrawerDay13(),
    SchoolDay13(),
    BussinesDay13(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          changeBottom(value);
        },
        currentIndex: _selectedBottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: "School"),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: "business",
          ),
        ],
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
