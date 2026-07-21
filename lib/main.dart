import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_5/layouting.dart';
import 'package:flutter1_b3_2026/day_5/scaffold.dart';
import 'package:flutter1_b3_2026/day_5/styling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: StylingDay5 ()
    );
  }
}
