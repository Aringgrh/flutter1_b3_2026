import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/model/login_user_model.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/pendaftaran.dart';

class BerandaTugas12 extends StatefulWidget {
  const BerandaTugas12({super.key});

  @override
  State<BerandaTugas12> createState() => _BerandaTugas12State();
}

class _BerandaTugas12State extends State<BerandaTugas12> {
  TextEditingController namaC = TextEditingController();
  TextEditingController nomorC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController konfirmC = TextEditingController();
  TextEditingController alamatC = TextEditingController();
  void _refresh() {
    setState(() {});
  }

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
              Text(
                "Daftar Pengguna",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
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
                  return Center(
                    child: Text('Terjadi kesalahan: ${snapshot.error}'),
                  ); // Center
                }

                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Tidak ada data pengguna.'),
                  ); // Center
                }

                final daftarPengguna = snapshot.data!;

                return ListView.builder(
                  itemCount: daftarPengguna.length,
                  itemBuilder: (context, index) {
                    final user = daftarPengguna[index];
                    return Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ), // CircleAvatar
                        title: Text("Nama: ${user.nama}"),
                        subtitle: Column(
                          children: [
                            Row(children: [Text("No.HP: ${user.nomorhp}")]),
                            Row(children: [Text("Email: ${user.email}")]),
                            Row(children: [Text("Password: ${user.password}")]),
                            Row(children: [Text("Alamat: ${user.alamat}")]),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context, user);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () async {
                                setState(() {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Info"),
                                        content: Text(
                                          "Apakah anda yakin ingin menghapus akun pengguna ini?",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              context.pop(BerandaTugas12());
                                            },
                                            child: Text("Tidak"),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if (user.id != null) {
                                                await DBHelper().deleteUser(
                                                  user.id!,
                                                );
                                                if (context.mounted) {
                                                  Navigator.pop(context);
                                                  _refresh();
                                                  ScaffoldMessenger.of(
                                                    context,
                                                  ).showSnackBar(
                                                    const SnackBar(
                                                      content: Text(
                                                        'Data berhasil dihapus',
                                                      ),
                                                    ),
                                                  );
                                                }
                                              }
                                            },
                                            child: Text("Ya"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                });
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ), // ListTile
                    ); // Card
                  },
                ); // ew.builder
              },
            ), // FutureBuilder
          ),
          alertDialog(context),
        ],
      ),
    );
  }

  Padding alertDialog(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Tambah"),
                      content: Text("Tambah Pengguna?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop(BerandaTugas12());
                          },
                          child: Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push(PendaftaranTugas12());
                          },
                          child: Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              });
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, UserModelLoginSQL? user) {
    // Inisialisasi controller teks dari data pengguna yang dipilih (jika ada).
    final namaController = TextEditingController(text: user?.nama ?? "");
    final noHpController = TextEditingController(text: user?.nomorhp ?? "");
    final emailController = TextEditingController(text: user?.email ?? "");
    final passwordController = TextEditingController(
      text: user?.password ?? "",
    );
    final alamatController = TextEditingController(text: user?.alamat ?? "");

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Supaya bottom sheet menyesuaikan tinggi keyboard
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Kelola Pengguna',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Input Email
              TextField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Input Email
              TextField(
                controller: noHpController,
                decoration: const InputDecoration(
                  labelText: 'No.Hp',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              // Input Email
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Input Password
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              // Input Nomor HP
              TextField(
                controller: alamatController,
                decoration: const InputDecoration(
                  labelText: 'Alamat',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),

              // Aksi 1: Tambah Pengguna Baru
              const SizedBox(height: 10),
              // Baris Aksi 2 & 3: Update dan Delete Data Pengguna
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Aksi 2: Update Pengguna
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                    icon: const Icon(Icons.edit, color: Colors.white),
                    label: const Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (user?.id != null) {
                        final updatedUser = UserModelLoginSQL(
                          id: user?.id,
                          nama: namaController.text,
                          nomorhp: noHpController.text,
                          email: emailController.text.trim(),
                          password: passwordController.text,
                          alamat: alamatController.text,
                        );

                        bool success = await DBHelper().updateUser(updatedUser);
                        if (success && context.mounted) {
                          Navigator.pop(context);
                          _refresh();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Data berhasil diperbarui'),
                            ),
                          );
                        }
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
