import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/App_images.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/bottom_nav.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login/halaman_login.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login/halaman_pendaftaran.dart';
import 'package:lottie/lottie.dart';

class SplashScreenTugas12 extends StatefulWidget {
  const SplashScreenTugas12({super.key});

  @override
  State<SplashScreenTugas12> createState() => _SplashScreenTugas12State();
}

class _SplashScreenTugas12State extends State<SplashScreenTugas12> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    if (PreferenceHandler.isLogin == true) {
      context.pushAndRemoveAll(const BottomNavTugas12());
    } else {
      context.pushAndRemoveAll(const HalamanLoginFodos());
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
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(AppImages.logo),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Lottie.asset("assets/animation/loading.json", height: 200),
          ],
        ),
      ),
    );
  }
}
