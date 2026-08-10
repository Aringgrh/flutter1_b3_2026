import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login.dart';

class ProfileTugas12 extends StatefulWidget {
  const ProfileTugas12({super.key});

  @override
  State<ProfileTugas12> createState() => _ProfileTugas12State();
}

class _ProfileTugas12State extends State<ProfileTugas12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            PreferenceHandler.logOut();
            context.pushAndRemoveAll(const HalamanLoginTugas12());
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Berhasil LogOut")));
          },
          icon: Icon(Icons.logout),
        ),
      ),
    );
  }
}
