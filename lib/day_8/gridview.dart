import 'package:flutter/material.dart';

class GridViewDay8 extends StatelessWidget {
  const GridViewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Grid View Day 8"),
        backgroundColor: Colors.greenAccent,
      ),

      body: GridView.count(
        crossAxisCount: 3, // Menampilkan 2 kotak per baris
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          Container(color: Colors.red),
          Container(color: Colors.green),
          Container(color: Colors.blue),
          Container(color: Colors.yellow),
        ],
      ),
    );
  }
}
