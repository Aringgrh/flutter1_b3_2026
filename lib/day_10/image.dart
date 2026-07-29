import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShowImageDay10 extends StatefulWidget {
  const ShowImageDay10({super.key});

  @override
  State<ShowImageDay10> createState() => _ShowImageDay10State();
}

class _ShowImageDay10State extends State<ShowImageDay10> {
  bool showImage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Show Image"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Align(alignment: AlignmentGeometry.center),
          showImage
              ? Image.asset(
                  "assets/images/jakarta.jpeg",
                  height: 200,
                  width: 200,
                )
              : Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2NvWOW1N5HvOY1qCkFQo1l3zB1-qCGgFrM9iJrcaHFw&s=10",
                  height: 200,
                  width: 200,
                ),
          showImage
              ? Image.asset(
                  "assets/images/jakarta.jpeg",
                  height: 200,
                  width: 200,
                )
              : Shimmer(
                  duration: Duration(seconds: 1),
                  color: Colors.cyan,
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2NvWOW1N5HvOY1qCkFQo1l3zB1-qCGgFrM9iJrcaHFw&s=10",
                    height: 200,
                    width: 200,
                  ),
                ),
          SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {});
              showImage = !showImage;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    showImage ? "Gambar Ditampilkan" : "Gambar Disembunyikan",
                  ),
                ),
              );
            },
            child: Text(
              showImage ? "Sembunyikan" : "Tampilkan",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
