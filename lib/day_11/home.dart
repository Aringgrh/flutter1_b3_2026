import 'package:flutter/material.dart';

class HomeDay11 extends StatelessWidget {
  const HomeDay11({super.key});

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
