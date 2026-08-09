import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/model/login_user_model.dart';

class BerandaTugas12 extends StatefulWidget {
  const BerandaTugas12({super.key});

  @override
  State<BerandaTugas12> createState() => _BerandaTugas12State();
}

class _BerandaTugas12State extends State<BerandaTugas12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Beranda")),
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Daftar Pengguna", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<UserModelLoginSQL>>(
              future: DBHelper().getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text('Terjadi kesalahan: ${snapshot.error}')); // Center
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Tidak ada data pengguna.')); // Center
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Column(children: [Icon(Icons.person)]),
                        ), // CircleAvatar
                        title: Text(user.nama),
                        subtitle: Text('Password: ${user.password}'),
                      ), // ListTile
                    ); // Card
                  },
                ); // ListView.builder
              },
            ), // FutureBuilder
          ),
        ],
      ),
    );
  }
}
