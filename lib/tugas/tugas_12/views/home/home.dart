import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/views/home/widget_home.dart';

class HomeFodos extends StatefulWidget {
  const HomeFodos({super.key});

  @override
  State<HomeFodos> createState() => _HomeFodosState();
}

final List<String> gambar = [
  "assets/images/jeruk.png",
  "assets/images/pisang.png",
  "assets/images/semangka.png",
];

class _HomeFodosState extends State<HomeFodos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 70,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Row(
                      children: [
                        Icon(Icons.location_on_outlined),
                        TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text("JL Sudirman"),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none_outlined),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Cari makanan",
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.filter_list_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: gambar
                  .map(
                    (item) => Container(
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: BoxBorder.all(),
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
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [Text("Kategori", style: AppTextstyle.heading2)],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  pilihanKategori(icon: Icons.bakery_dining, text: "Roti"),
                  SizedBox(width: 10),
                  pilihanKategori(
                    width: 150,
                    icon: Icons.restaurant_outlined,
                    text: "Makanan Berat",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
