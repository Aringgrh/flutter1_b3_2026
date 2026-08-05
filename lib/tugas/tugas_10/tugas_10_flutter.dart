import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/tugas/tugas_10/data_pendaftaran.dart';

class Tugas10Flutter extends StatefulWidget {
  const Tugas10Flutter({super.key});

  @override
  State<Tugas10Flutter> createState() => _Tugas10FlutterState();
}

class _Tugas10FlutterState extends State<Tugas10Flutter> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  final TextEditingController tambahanController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Pendaftaran"),
        backgroundColor: Colors.cyan,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
              Row(children: [Text("Nama Lengkap")]),
              TextFormField(
                controller: namaController,
                decoration: InputDecoration(
                  hintText: "Masukkan Nama",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama harus diisi";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Row(children: [Text("Email")]),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email harus diisi";
                  } else if (value.contains('@')) {
                    return "Harus mengandung karakter @";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              Row(children: [Text("Nomor Telepon")]),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Masukkan Nomer",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: nomorController,
              ),
              SizedBox(height: 20),

              Row(children: [Text("Data Tambahan")]),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Masukkan Data",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: tambahanController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Data harus diisi";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print(namaController.text);
                  print(emailController.text);
                  print(nomorController.text);
                  print(tambahanController.text);
                  if (_formKey.currentState!.validate()) {
                    // context.push(DrawerDay13());
                    context.push(
                      DataPendaftaran(
                        email: emailController.text,
                        email: emailController.text,
                        email: emailController.text,
                      ),
                    );
                  } else {
                    print("Belum Tervalidasi");
                    showDialog(
                      context: context,
                      builder: ((context) => AlertDialog(
                        backgroundColor: Colors.grey[100],
                        title: Text("Info"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            LottieBuilder.asset(
                              "assets/animation/Error animation.json",
                            ),
                            Text("${emailController.text} Tidak Valid"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text("Baiklah"),
                          ),
                        ],
                      )),
                    );
                  }
                },
                child: Text("Tekan ini"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
