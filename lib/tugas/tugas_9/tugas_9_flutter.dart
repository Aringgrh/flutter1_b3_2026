import 'package:flutter/material.dart';

class Tugas9Flutter extends StatelessWidget {
  Tugas9Flutter({super.key});
  List<Map<String, dynamic>> namaBuah = [
    {
      "nama": "Apel",
      "deskripsi":
          "Manfaat buah jeruk untuk kesehatan meliputi meningkatkan daya tahan tubuh, melancarkan pencernaan, dan ",
      "gambar": "assets/images/apell.jpg",
    },
    {
      "nama": "Jeruk",
      "deskripsi":
          "Buah apel sangat baik untuk kesehatan karena kaya akan serat pektin, vitamin C, dan antioksidan yang membantu melancarkan pencernaan, menjaga kesehatan jantung, serta mengontrol kadar gula darah",
      "gambar": "assets/images/jeruk.png",
    },
    {
      "nama": "Semangka",
      "deskripsi":
          "Manfaat buah semangka meliputi mencegah dehidrasi, melancarkan pencernaan, dan menjaga kesehatan jantung. Buah segar ini kaya akan kandungan air (sekitar 90-92%) serta berbagai vitamin dan antioksidan penting.",
      "gambar": "assets/images/semangka.png",
    },
    {
      "nama": "Salak",
      "deskripsi":
          "Manfaat makan buah salak meliputi melancarkan pencernaan, menjaga kesehatan mata, dan meningkatkan daya tahan tubuh. Buah bersisik ini kaya akan serat, beta-karoten, vitamin C, serta kalium yang baik untuk kesehatan tubuh secara menyeluruh. ",
      "gambar": "assets/images/salak.png",
    },
    {
      "nama": "Manggis",
      "deskripsi":
          "Manfaat buah manggis meliputi meningkatkan daya tahan tubuh, menurunkan berat badan, dan mengontrol gula darah. Buah ini kaya akan vitamin, serat, serta zat antioksidan kuat",
      "gambar": "assets/images/manggis.png",
    },
    {
      "nama": "Anggur",
      "deskripsi":
          "Buah anggur sangat baik untuk kesehatan karena kaya akan antioksidan, vitamin C, dan potasium. Manfaat utamanya meliputi menjaga kesehatan jantung, menurunkan tekanan darah, dan meningkatkan daya tahan tubuh",
      "gambar": "assets/images/anggur.png",
    },
    {
      "nama": "Pisang",
      "deskripsi":
          "Buah pisang memiliki banyak manfaat penting, antara lain sebagai sumber energi, menjaga kesehatan pencernaan, dan menjaga kesehatan jantung",
      "gambar": "assets/images/pisang.png",
    },
    {
      "nama": "Strawberry",
      "deskripsi":
          "Buah stroberi kaya akan vitamin C, serat, dan antioksidan yang bermanfaat untuk menjaga daya tahan tubuh, menyehatkan jantung, dan melancarkan pencernaan",
      "gambar": "assets/images/strawberry.png",
    },
    {
      "nama": "Alpukat",
      "deskripsi":
          "Manfaat buah alpukat meliputi menjaga kesehatan jantung, melancarkan pencernaan, dan mengontrol tekanan darah",
      "gambar": "assets/images/alpukat.png",
    },
    {
      "nama": "Pepaya",
      "deskripsi":
          "Buah pepaya bermanfaat untuk melancarkan pencernaan, menjaga kesehatan kulit, dan meningkatkan daya tahan tubuh berkat kandungan serat, enzim papain, serta vitamin C yang tinggi",
      "gambar": "assets/images/pepaya.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: namaBuah.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              namaBuah[index]["nama"],
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(namaBuah[index]["deskripsi"]),
            trailing: Image.asset(namaBuah[index]["gambar"]),
          );
        },
      ),
    );
  }
}
