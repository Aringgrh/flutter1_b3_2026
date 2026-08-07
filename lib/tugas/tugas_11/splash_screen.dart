import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_18/views/login_day_18.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_11/drawer_tugas_11.dart';
import 'package:lottie/lottie.dart';

class SplashScreenLogo extends StatefulWidget {
  const SplashScreenLogo({super.key});

  @override
  State<SplashScreenLogo> createState() => _SplashScreenLogoState();
}

class _SplashScreenLogoState extends State<SplashScreenLogo> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (PreferenceHandler.isLogin == true) {
      context.push(const DrawerTugas11());
    } else {
      context.push(const LoginDay18SQFLITE());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 100),
            Image.asset("assets/images/alpukat.png", height: 200, width: 200),

            Lottie.asset("assets/animation/loading.json", height: 200),
          ],
        ),
      ),
    );
  }
}
