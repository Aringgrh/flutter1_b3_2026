import 'package:flutter/material.dart';

class TextFiledDay8 extends StatelessWidget {
  const TextFiledDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Field Day 8"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.greenAccent,
                hintText: "Masukkan Nama",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Masukkan Sandi',
                border: OutlineInputBorder(),
                suffix: Icon(Icons.remove_red_eye),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nama Lengkap',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
