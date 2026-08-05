import 'package:flutter/material.dart';

class ListLevel2 extends StatelessWidget {
  ListLevel2({super.key});
  List<Map<String, dynamic>> kategori = [
    {'nama': 'Buah-Buahan', 'icon': Icons.apple},
    {'nama': 'Rumah', 'icon': Icons.home},
    {'nama': 'Buku', 'icon': Icons.book},
    {'nama': 'Orang', 'icon': Icons.person},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: kategori.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(kategori[index]['icon']),
            title: Text(kategori[index]['nama']),
          );
        },
      ),
    );
  }
}
