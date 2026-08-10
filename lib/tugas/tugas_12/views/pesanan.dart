import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_13/login.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';

class PesananTugas12 extends StatefulWidget {
  const PesananTugas12({super.key});

  @override
  State<PesananTugas12> createState() => _PesananTugas12State();
}

class _PesananTugas12State extends State<PesananTugas12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
          onPressed: () {
            PreferenceHandler.logOut();
            context.pushAndRemoveAll(const HalamanLogin());
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
