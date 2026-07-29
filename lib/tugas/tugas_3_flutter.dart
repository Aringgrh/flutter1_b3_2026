import 'package:flutter/material.dart';

class Tugas3Flutter extends StatelessWidget {
  const Tugas3Flutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrasi & Edukasi"),
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Container(
                  height: 440,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      Align(alignment: AlignmentGeometry.center),
                      Text(
                        "Form Registrasi",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: "Nama Pengguna",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            labelText: "Email Pengguna",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: "Telepon Pengguna",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            labelText: "Input Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.key),
                            labelText: "Konfirmasi Pasword",
                            hintText: "Masukkan Konfirmasi Password",
                            suffixIcon: Icon(Icons.remove_red_eye),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(alignment: AlignmentGeometry.center),
            Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20)),
            Text(
              "Wilayah Pemantauan Kualitas Udara Terdekat",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/banda_aceh.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Banda Aceh")),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/bandung.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Bandung")),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/bukittinggi.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Bukittinggi")),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/jakarta.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Jakarta")),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/medan.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Medan")),
                  ],
                ),
                Stack(
                  clipBehavior: Clip.none,
                  alignment: AlignmentGeometry.center,
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/yogyakarta.jpeg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      child: Container(
                        height: 25,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    Positioned(bottom: -3, child: Text("Yogyakarta")),
                  ],
                ),
                // Stack(
                //   alignment: AlignmentGeometry.center,
                //   clipBehavior: Clip.none,
                //   children: [
                //     Image.asset('assets/images/yogyakarta.jpg'),
                //     Positioned(
                //       bottom: 13,
                //       child: Container(
                //         height: 20,
                //         width: 100,
                //         decoration: BoxDecoration(
                //           color: Colors.greenAccent,
                //           borderRadius: BorderRadius.circular(20),
                //         ),
                //         alignment: Alignment.center,
                //         child: Text("Yogyakarta"),
                //       ),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
