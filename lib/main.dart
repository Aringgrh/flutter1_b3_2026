import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_13/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // PUSH NAMED
      initialRoute: "/",
      // routes: {
      //   "/": (context) => RoutingDay11(),
      //   "/home": (context) => HomeDay11(),
      // },
      home: HalamanLogin(),
    );
  }
}
