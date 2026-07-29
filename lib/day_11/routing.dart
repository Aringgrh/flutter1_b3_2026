import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_11/home.dart';

class RoutingDay11 extends StatelessWidget {
  const RoutingDay11({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Routing Day 11"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          tombolPush(context),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/home");
              },
              child: Text("Push Named"),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeDay11()),
                );
              },
              child: Text("Push Named"),
            ),
          ),
        ],
      ),
    );
  }

  Center tombolPush(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeDay11()),
          );
        },
        child: Text("Push"),
      ),
    );
  }
}
