import 'package:flutter/material.dart';

class CheckTugas7 extends StatefulWidget {
  const CheckTugas7({super.key});

  @override
  State<CheckTugas7> createState() => _CheckTugas7State();
}

class _CheckTugas7State extends State<CheckTugas7> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [checkBox(), Text("Saya menyetujui persyaratan")],
          ),
          Text(isCheck ? "Pendaftaran diperbolehkan " : "Pendaftaran Belum Tersedia"),
        ],
      ),
    );
  }

  Checkbox checkBox() {
    return Checkbox(
      value: isCheck,
      onChanged: (value) {
        isCheck = value ?? false;
        setState(() {});
      },
    );
  }
}
