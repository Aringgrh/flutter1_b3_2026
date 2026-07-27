import 'package:flutter/material.dart';

class ContohStatefull extends StatefulWidget {
  const ContohStatefull({super.key});

  @override
  State<ContohStatefull> createState() => _ContohStatefullState();
}

class _ContohStatefullState extends State<ContohStatefull> {
  int counter = 0;

  bool showImage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(alignment: AlignmentGeometry.center),
          SizedBox(height: 200),

          ElevatedButton(
            onPressed: () {
              debugPrint("Tombol sentuh");
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("Kotak Disentuh")));
            },
            child: Text("Klik Saya"),
          ),

          TextButton(
            onPressed: () {
              setState(() {
                showImage = !showImage;
              });
            },
            child: Text(showImage ? "Sembunyikan Gambar" : "Lihat Gambar"),
          ),
          if (showImage)
            Image.network("https://picsum.photos/200", width: 200, height: 200),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  setState(() {
                    Icon(Icons.favorite_border, color: Colors.red);
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.comment_outlined),
                onPressed: () {
                  debugPrint("Ikon Diklik");
                },
              ),
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  debugPrint("Ikon Diklik");
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              debugPrint("Tombol Ditekan");
            },
            child: Text("Baca Selengkapnya"),
          ),
          InkWell(
            onTap: () {
              debugPrint("Tombol Ditekan");
            },
            child: Text("Contoh"),
          ),
          GestureDetector(
            onTap: () {
              debugPrint("PErcobaan Gestur sekali ");
            },
            onDoubleTap: () {
              debugPrint("PErcobaan Gestur klik dua kali");
            },
            onLongPress: () {
              debugPrint("PErcobaan Gestur tekan lama");
            },
            child: Container(
              color: Colors.red,
              padding: EdgeInsets.all(20),
              child: Text("Tekan saya"),
            ),
          ),

          FloatingActionButton(
            onPressed: () {
              debugPrint("FAB Ditekan");
            },
            tooltip: "Tambah Data",
            child: Icon(Icons.add),
          ),
          // Text("Nilai: $counter", style: TextStyle(color: Colors.green)),
          // ElevatedButton(
          //   onPressed: () {
          //     // Langkah 6: Tambahkan setState di dalam fungsi aksi
          //     setState(() {
          //       counter++; // Memperbarui nilai state
          //     });
          //   },
          //   child: Text(
          //     "Tambah",
          //     style: TextStyle(fontWeight: FontWeight.bold),
          //   ),
          // ),
        ],
      ),
    );
  }
}
