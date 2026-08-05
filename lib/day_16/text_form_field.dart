import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_16/home_abalabal.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:lottie/lottie.dart';

class TextFormFieldDay16 extends StatefulWidget {
  const TextFormFieldDay16({super.key});

  @override
  State<TextFormFieldDay16> createState() => _TextFormFieldDay16State();
}

class _TextFormFieldDay16State extends State<TextFormFieldDay16> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextField(
              controller: emailController,
              onChanged: (value) {
                setState(() {});
              },
            ),
            TextField(controller: emailController),
            TextField(controller: emailController),
            Text("Dibawah ini textformfield"),
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Email tidak boleh kosong";
                } else if (value.contains("@")) {
                  return "Email tidak valid";
                }
                return null;
              },
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password Tidak Boleh Kosong";
                } else if (value.length < 8) {
                  return "Password Tidak Boleh Kurang Dari Delapan Karakter";
                }
                return null;
              },
            ),
            TextFormField(
              controller: confirmPasswordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Konfirmasi Password Tidak Boleh Kosong";
                } else if (value != passwordController.text) {
                  return "Password Tidak Cocok";
                }
                return null;
              },
            ),
            Text(
              emailController.text,
              style: TextStyle(color: Colors.red, fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                print(emailController.text);
                print(passwordController.text);
                print(confirmPasswordController.text);
                if (_formKey.currentState!.validate()) {
                  // context.push(DrawerDay13());
                  context.push(
                    HomeAbalabalDay16(
                      email: emailController.text,
                      password: passwordController.text,
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
    );
  }
}
