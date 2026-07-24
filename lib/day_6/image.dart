import 'package:flutter/material.dart';

class ImageContainerDay6 extends StatelessWidget {
  const ImageContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Container Day 6"),
        backgroundColor: Colors.tealAccent,
      ),

      body: Column(
        children: [
          Container(
            height: 100,
            width: 400,

            decoration: BoxDecoration(
              shape: BoxShape.circle,

              image: DecorationImage(
                image: AssetImage('assets/images/adul.jpeg'),
              ),
            ),
          ),
          SizedBox(
            height: 400,
            width: 400,
            child: Column(
              children: [Text("Ahmad Ari Nugraha"), Text("089618832252")],
            ),
          ),
        ],
      ),
    );
  }
}
