import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/home/home.dart';

class CarouselImage {
  final List<String> gambar = [
    "assets/images/jeruk.png"
        "assets/images/pisang.png"
        "assets/images/semangka.png",
  ];
}

CarouselSlider carouselGambar() {
  return CarouselSlider(
    items: gambar
        .map(
          (item) => Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(item),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
        .toList(),
    options: CarouselOptions(
      height: 250,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(seconds: 2),
      aspectRatio: 16 / 9,
      viewportFraction: 0.8,
    ),
  );
}
