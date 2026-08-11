import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/App_images.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/database/db_helper.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/bottom_nav.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/pendaftaran.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/widget_method.dart';

class HalamanLoginTugas12 extends StatefulWidget {
  const HalamanLoginTugas12({super.key});

  @override
  State<HalamanLoginTugas12> createState() => _HalamanLoginTugas12State();
}

class _HalamanLoginTugas12State extends State<HalamanLoginTugas12> {
  final _formKey = GlobalKey<FormState>();
  bool hide = true;

  final TextEditingController emailC = TextEditingController();
  final TextEditingController passwordC = TextEditingController();

  void loginPengguna() async {
    final user = emailC.text.trim();
    final pass = passwordC.text;
    if (user.isEmpty || pass.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Isi semua field!')));
      return;
    }

    final pengguna = await DBHelper().loginUser(user, pass);

    if (!mounted) return;

    if (pengguna != null) {
      await PreferenceHandler.setLogin(true);
      if (!mounted) return;

      context.pushAndRemoveAll(BottomNavTugas12());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login gagal! email atau Password salah.'),
        ), // SnackBar
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 150),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(75),
                        // shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                          alignment: AlignmentGeometry.topCenter,
                          image: AssetImage(AppImages.logo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                Text("Fodos", style: AppTextstyle.heading1),
                Text(
                  "Selamatkan Makanan, Selamatkan Bumi",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(children: [Text("Email", style: AppTextstyle.heading2)]),
                textInput(
                  "Masukkan Email",
                  kontroller: emailC,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email tidak valid!";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Row(children: [Text("Password", style: AppTextstyle.heading2)]),
                passField(
                  obscureText: hide,
                  controller: passwordC,
                  hintText: "Masukkan Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    icon: Icon(hide ? Icons.visibility_off : Icons.visibility),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password Harus Di isi";
                    } else if (value.length < 8) {
                      return "Kata Sandi Harus Lebih Dari 8 Karakter";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Lupa Kata Sandi?",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        loginPengguna();
                        // context.push(PendaftaranTugas12());
                      }
                      return;
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    SizedBox(width: 10),
                    Text(
                      "ATAU MASUK DENGAN",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Expanded(child: Divider()),
                  ],
                ),

                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/fbIcon.png",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 10),

                        Text(
                          "Facebook",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 400,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/google.png",
                          width: 70,
                          height: 70,
                        ),

                        Text(
                          "Google",
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum punya akun?"),
                    TextButton(
                      onPressed: () {
                        context.push(PendaftaranTugas12());
                      },
                      child: Text(
                        "Daftar Sekarang",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
