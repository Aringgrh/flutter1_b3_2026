import 'package:flutter/material.dart';

class InformasiPribadi extends StatefulWidget {
  const InformasiPribadi({super.key});

  @override
  State<InformasiPribadi> createState() => _InformasiPribadiState();
}

class _InformasiPribadiState extends State<InformasiPribadi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Informasi Pribadi")));
  }
}
