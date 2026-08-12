import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/App_images.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';

class ProfileTugas12 extends StatefulWidget {
  const ProfileTugas12({super.key});

  @override
  State<ProfileTugas12> createState() => _ProfileTugas12State();
}

class _ProfileTugas12State extends State<ProfileTugas12> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: AppTextstyle.heading1)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.black,
                    image: DecorationImage(
                      image: AssetImage(AppImages.logo),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Pengaturan Akun", style: AppTextstyle.heading2),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 620,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: BoxBorder.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  menuProfil(
                    leading: Icon(Icons.person_outlined, size: 24),
                    title: Text("Informasi Pribadi"),
                    subtitle: Text("Ubah detail profil dan kontak"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),
                  menuProfil(
                    leading: Icon(Icons.folder_copy_outlined, size: 24),
                    title: Text("Metode Pembayaran"),
                    subtitle: Text("Gopay, ShoopePay, Kartu Kredit"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),

                  menuProfil(
                    leading: Icon(Icons.location_on_outlined, size: 24),
                    title: Text("Alamat Tersimpan"),
                    subtitle: Text("Rumah, Kantor, Apartemen"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),

                  menuProfil(
                    leading: Icon(Icons.shield_outlined, size: 24),
                    title: Text("Keamana & Password"),
                    subtitle: Text("Ubah detail profil dan kontak"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),
                  menuProfil(
                    leading: Icon(Icons.error_outline_outlined, size: 24),
                    title: Text("Tentang Aplikasi"),
                    subtitle: Text("Versi aplikasi, syarat & ketentuan"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),
                  menuProfil(
                    leading: Icon(
                      Icons.logout_outlined,
                      size: 24,
                      color: Colors.red,
                    ),
                    title: Text("Keluar", style: TextStyle(color: Colors.red)),
                    subtitle: Text(
                      "Keluar dari sesi saat ini",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextButton menuProfil({
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    Widget? trailing,
  }) {
    return TextButton(
      style: ButtonStyle(),
      onPressed: () {},
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
      ),
    );
  }
}
