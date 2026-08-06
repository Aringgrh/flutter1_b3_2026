// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DataPendaftaran extends StatelessWidget {
  const DataPendaftaran({
    super.key,
    required this.nama,
    required this.email,
    required this.nomor,
    required this.tambahan,
  });
  final String nama;
  final String email;
  final String? nomor;
  final String tambahan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi Pendaftaran",),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Lottie.asset("assets/animation/Hign five.json"),
            Text(
              "Terima Kasih, $nama dari $tambahan telah mendaftar",
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
