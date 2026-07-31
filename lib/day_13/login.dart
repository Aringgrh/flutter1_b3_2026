import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_11/home.dart';
import 'package:flutter1_b3_2026/day_13/bottom_nav.dart';

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

bool sembunyikan = false;

class _HalamanLoginState extends State<HalamanLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 186,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/jakarta.jpeg'),
                  fit: BoxFit.fill,
                ),
                color: const Color.fromRGBO(217, 217, 217, 1),
              ),
              child: Center(
                child: Text(
                  "PPKD",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
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
                obscureText: sembunyikan,
                decoration: InputDecoration(
                  hintText: "Masukkan Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        sembunyikan = !sembunyikan;
                      });
                    },
                    icon: Icon(
                      sembunyikan ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Container(
              alignment: AlignmentGeometry.bottomRight,
              padding: EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeDay11()),
                  );
                },
                child: Text(
                  "Lupa Password?",
                  style: TextStyle(
                    color: const Color.fromRGBO(234, 148, 89, 1),
                    fontFamily: "Arimo",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Container(
              width: double.infinity,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromRGBO(248, 98, 58, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavDay13()),
                  );
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Arimo',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider()),
                  SizedBox(width: 10),
                  Text(
                    "Or Sign In With",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Arimo',
                      color: const Color.fromRGBO(136, 136, 136, 1),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(child: Divider()),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: iconLogin(
                        'assets/images/googleIcon.png',
                        "Google",
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 70),
                Stack(
                  children: [
                    Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: const Color.fromRGBO(217, 217, 217, 1),
                      ),
                      child: iconLogin('assets/images/fbIcon.png', "Facebook"),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Container(
              alignment: AlignmentGeometry.bottomLeft,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontFamily: 'Arimo', fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeDay11()),
                      );
                    },
                    child: Text(
                      "Join Us",
                      style: TextStyle(
                        color: const Color.fromRGBO(234, 148, 89, 1),
                        fontFamily: "Arimo",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
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

  Row iconLogin(AssetImage, String currenText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AssetImage, cacheHeight: 30),
        SizedBox(width: 10),
        Text(
          currenText,
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Arimo',
            color: Colors.black,
          ),
        ),
      ],
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
