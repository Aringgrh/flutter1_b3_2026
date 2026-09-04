import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login/login.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/splash_screen.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/views/post_list_tugas.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting("id_ID", null);
  await PreferenceHandler.init();
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
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
      // PUSH NAMED
      initialRoute: "/",
      routes: {
        "/": (context) => const Tugas15PostList(),
        // "/home": (context) => DrawerDay13(),
      },
      // home: HalamanLogin(),
    );
  }
}

