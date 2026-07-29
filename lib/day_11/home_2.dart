import 'package:flutter/material.dart';

class Home2Day11 extends StatelessWidget {
  const Home2Day11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Day 11"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Kembali/Pop"),
            ),
          ),
        ],
      ),
    );
  }
}
