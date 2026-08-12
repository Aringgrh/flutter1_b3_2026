import 'package:flutter/material.dart';
// import 'package:flutter1_b3_2026/day_18/views/login_day_18.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/bottom_nav.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.white)),
      // PUSH NAMED
      initialRoute: "/",
      routes: {
        "/": (context) => BottomNavTugas12(),
        // "/home": (context) => DrawerDay13(),
      },
      // home: HalamanLogin(),
    );
  }
}
