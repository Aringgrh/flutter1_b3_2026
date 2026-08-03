import 'package:flutter/material.dart';

class CheckTugas7 extends StatefulWidget {
  const CheckTugas7({super.key});

  @override
  State<CheckTugas7> createState() => _CheckTugas7State();
}

class _CheckTugas7State extends State<CheckTugas7> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: _isCheck,
                onChanged: (value) {
                  _isCheck = value ?? false;
                  setState(() {});
                },
              ),
              Text("Saya menyetujui persyaratan"),
            ],
          ),
          Text(
            _isCheck
                ? "Pendafratan diperbolehkan "
                : "Pendaftaran Belum Tersedia",
          ),
        ],
      ),
    );
  }
}
