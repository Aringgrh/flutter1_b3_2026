import 'package:flutter/material.dart';

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

  final List<Widget> _widgetOption = [
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
