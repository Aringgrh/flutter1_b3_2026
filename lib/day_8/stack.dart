import 'package:flutter/material.dart';

class StackDay8 extends StatelessWidget {
  const StackDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(34),
        ),
        title: Text("Stack Day 8"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Stack(
            alignment: AlignmentGeometry.center,

            children: [
              Container(color: Colors.red, height: 400, width: 400),
              Container(color: Colors.yellow, height: 300, width: 300),
              Container(color: Colors.green, height: 200, width: 200),
            ],
          ),
          Stack(
            alignment: AlignmentGeometry.center,

            children: [
              Container(color: Colors.red, height: 100, width: 100),
              Container(color: Colors.yellow, height: 75, width: 75),
              Container(color: Colors.green, height: 50, width: 50),
            ],
          ),
        ],
      ),
    );
  }
}
