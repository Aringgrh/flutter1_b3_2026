// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

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
  final String nomor;
  final String tambahan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Text(nama), Text(email), Text(nomor), Text(tambahan)],
      ),
    );
  }
}
