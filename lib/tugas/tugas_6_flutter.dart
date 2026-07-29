import 'package:flutter/material.dart';

class Tugas6Flutter extends StatelessWidget {
  const Tugas6Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 186,
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(217, 217, 217, 1),
            ),
            child: Center(
              child: Text(
                "PPKD",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  fontFamily: 'Arimo',
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Login Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Arimo',
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Hello, you must login first to be able to use the application and enjoy all the features in Calashop",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Arimo',
                color: const Color.fromRGBO(136, 136, 136, 1),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Email Address",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Arimo',
                color: const Color.fromRGBO(136, 136, 136, 1),
              ),
            ),
          ),
          SizedBox(height: 10),
          inputBotton("Masukkan Email Anda"),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Arimo',
                color: const Color.fromRGBO(136, 136, 136, 1),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Password",
                suffixIcon: Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentGeometry.bottomRight,
            padding: EdgeInsets.only(right: 20),
            child: Text("Lupa Password?"),
          ),
        ],
      ),
    );
  }

  Padding inputBotton(String currentHint) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        decoration: InputDecoration(
          hintText: currentHint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
