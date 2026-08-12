import 'package:flutter/material.dart';

class HalamanPencarianFodos extends StatefulWidget {
  const HalamanPencarianFodos({super.key});

  @override
  State<HalamanPencarianFodos> createState() => _HalamanPencarianFodosState();
}

class _HalamanPencarianFodosState extends State<HalamanPencarianFodos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Pencarian")));
  }
}
