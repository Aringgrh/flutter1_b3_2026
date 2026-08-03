import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/tugas_7_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  await initializeDateFormatting("id_ID", null);
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
      routes: {
        "/": (context) => Tugas7Flutter(),
        // "/home": (context) => DrawerDay13(),
      },
      // home: HalamanLogin(),
    );
  }
}
