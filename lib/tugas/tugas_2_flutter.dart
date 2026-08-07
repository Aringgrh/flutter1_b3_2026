import 'package:flutter/material.dart';

class Tugas2 extends StatelessWidget {
  const Tugas2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          Align(alignment: AlignmentGeometry.topCenter),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text("Food Saver", style: TextStyle(fontSize: 34)),
          ),
        ],
      ),
    );
  }
}
