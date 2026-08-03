import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_11/home.dart';

class CobaLogin extends StatefulWidget {
  const CobaLogin({super.key});

  @override
  State<CobaLogin> createState() => _CobaLoginState();
}

class _CobaLoginState extends State<CobaLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 80)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "FODOS",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email Addres",
                hintText: "Masukkan Email Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                hintText: "Masukkan Password Anda",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220),
              child: Text(
                "Lupa Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeDay11()),
                );
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
