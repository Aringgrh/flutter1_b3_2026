import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/App_images.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
<<<<<<< HEAD
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login/halaman_login.dart';
=======
import 'package:flutter1_b3_2026/tugas/tugas_12/views/login/login.dart';
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/informasi_pribadi.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/profil_alamat.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/profil_keamanan.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/profil_metode_pembayaran.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/profile/profil_tentang_aplikasi.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';

class ProfileTugas12 extends StatefulWidget {
  const ProfileTugas12({super.key});

  @override
  State<ProfileTugas12> createState() => _ProfileTugas12State();
}

class _ProfileTugas12State extends State<ProfileTugas12> {
  String _userName = 'ariii';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final email = await PreferenceHandler.getUserEmail();
      if (email != null && email.isNotEmpty) {
        final user = await DBHelper().getUserByEmail(email);
        if (user != null && mounted) {
          setState(() {
            _userName = user.nama;
          });
        }
      }
    } catch (e) {
      debugPrint("Error loading user data in profile: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            const Icon(Icons.location_on, color: AppColors.primary, size: 24),
            const SizedBox(width: 8),
            const Text(
              "FODOS",
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Avatar profile stack
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
                Stack(
                  children: [
                    Container(
                      height: 96,
                      width: 96,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.1),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                        border: Border.all(color: Colors.white, width: 4),
                        image: const DecorationImage(
                          image: AssetImage(AppImages.produk1),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondary,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(
                          Icons.verified,
                          color: Colors.white,
                          size: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _userName,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
=======
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
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
              ),
            ),

            const SizedBox(height: 24),

            // Section Pengaturan Akun Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Pengaturan Akun",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),

<<<<<<< HEAD
            // Card Menu
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.border, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
=======
                  menuProfil(
                    onPressed: () {
                      setState(() {
                        print("Berhasil Dipencet");
                        context.push(InformasiPribadi());
                      });
                    },
                    leading: Icon(Icons.location_on_outlined, size: 24),
                    title: Text("Alamat Tersimpan"),
                    subtitle: Text("Rumah, Kantor, Apartemen"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),

                  menuProfil(
                    onPressed: () {
                      context.push(ProfilKeamanan());
                    },
                    leading: Icon(Icons.shield_outlined, size: 24),
                    title: Text("Keamana & Password"),
                    subtitle: Text("Ubah detail profil dan kontak"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),
                  menuProfil(
                    onPressed: () {
                      context.push(ProfilTentangAplikasi());
                    },
                    leading: Icon(Icons.error_outline_outlined, size: 24),
                    title: Text("Tentang Aplikasi"),
                    subtitle: Text("Versi aplikasi, syarat & ketentuan"),
                    trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  ),
                  Divider(),
                  menuProfil(
                    onPressed: () {
                      context.push(HalamanLoginTugas12());
                    },
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
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Column(
                  children: [
                    menuProfil(
                      onPressed: () async {
                        await context.push(const InformasiPribadi());
                        _loadUserData();
                      },
                      leading: const Icon(
                        Icons.person_outline,
                        color: Color(0xFF404941),
                        size: 22,
                      ),
                      title: "Informasi Pribadi",
                      subtitle: "Ubah detail profil dan kontak",
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    menuProfil(
                      onPressed: () {
                        context.push(const MetodePembayaranProfile());
                      },
                      leading: const Icon(
                        Icons.account_balance_wallet_outlined,
                        color: Color(0xFF404941),
                        size: 22,
                      ),
                      title: "Metode Pembayaran",
                      subtitle: "Gopay, ShopeePay, Kartu Kredit",
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    menuProfil(
                      onPressed: () {
                        context.push(const ProfilAlamat());
                      },
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF404941),
                        size: 22,
                      ),
                      title: "Alamat Tersimpan",
                      subtitle: "Rumah, Kantor, Apartemen",
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    menuProfil(
                      onPressed: () {
                        context.push(const ProfilKeamanan());
                      },
                      leading: const Icon(
                        Icons.security_outlined,
                        color: Color(0xFF404941),
                        size: 22,
                      ),
                      title: "Keamanan & Password",
                      subtitle: "Ubah password, autentikasi 2 faktor",
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    menuProfil(
                      onPressed: () {
                        context.push(const ProfilTentangAplikasi());
                      },
                      leading: const Icon(
                        Icons.info_outline,
                        color: Color(0xFF404941),
                        size: 22,
                      ),
                      title: "Tentang Aplikasi",
                      subtitle: "Versi aplikasi, syarat & ketentuan",
                      trailing: const Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textGrey,
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1,
                      color: AppColors.border,
                    ),
                    menuProfil(
                      onPressed: () async {
                        await PreferenceHandler.logOut();
                        if (context.mounted) {
                          context.push(const HalamanLoginFodos());
                        }
                      },
                      leading: const Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 22,
                      ),
                      title: "Keluar",
                      subtitle: "Keluar dari sesi saat ini",
                      isDestructive: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget menuProfil({
    required VoidCallback onPressed,
    required Widget leading,
    required String title,
    required String subtitle,
    Widget? trailing,
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onPressed,
<<<<<<< HEAD
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isDestructive
                    ? const Color(0xFFFFDAD6).withValues(alpha: 0.4)
                    : const Color(0xFFEDEEEF),
              ),
              child: leading,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDestructive
                          ? Colors.red.withValues(alpha: 0.6)
                          : AppColors.textGrey,
                    ),
                  ),
                ],
              ),
            ),
            trailing ?? const SizedBox.shrink(),
          ],
        ),
=======
      child: ListTile(
        leading: leading,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
>>>>>>> 094f051565af982a8ebf127649c9106c19de6c0a
      ),
    );
  }
}
