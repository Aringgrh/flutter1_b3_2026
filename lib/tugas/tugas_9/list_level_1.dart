import 'package:flutter/material.dart';

class ListLevenl1 extends StatelessWidget {
  ListLevenl1({super.key});
  List<String> namaBuah = [
    "Apel",
    "Jeruk",
    "Semangka",
    "Salak",
    "MAnggis",
    "Anggur",
    "Pisang",
    "Strawberry",
    "Alpukat",
    "Pepaya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaBuah.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(namaBuah[index], style: TextStyle(height: 5));
        },
      ),
    );
  }
}
