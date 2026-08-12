import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/App_images.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/carousel.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/display_produk.dart';
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
        physics: AlwaysScrollableScrollPhysics(),
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
            carouselGambar(),
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
                  pilihanKategori(icon: Icons.restaurant_menu, text: "Semua"),
                  SizedBox(width: 10),
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
            SizedBox(height: 20),
            displayProduk(
              image: AppImages.produk1,
              namaMakanan: "Jeruk",
              namaToko: "Toko buah Ari",
              sisaPorsi: "3",
              pickUp: "19:00-20:00",
            ),
            SizedBox(height: 20),

            displayProduk(
              image: AppImages.produk2,
              namaMakanan: "alpukat",
              namaToko: "Warung makan Ari",
              sisaPorsi: "5",
              pickUp: "20:00-21:00",
            ),
            SizedBox(height: 20),
            displayProduk(
              image: AppImages.produk3,
              namaMakanan: "Semangka",
              namaToko: "Rumah makan sederhana",
              sisaPorsi: "1",
              pickUp: "20:00-21:00",
            ),
          ],
        ),
      ),
    );
  }
}
