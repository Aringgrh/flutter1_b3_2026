import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_12/constants/app_textstyle.dart';

Container displayProduk({
  required String image,
  required String namaMakanan,
  required String namaToko,
  required String sisaPorsi,
  required String pickUp,
}) {
  return Container(
    height: 310,
    width: double.infinity,
    margin: EdgeInsets.symmetric(horizontal: 20),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
          ),
          child: Image.asset(image, fit: BoxFit.cover),
        ),
        SizedBox(height: 5),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(namaMakanan, style: AppTextstyle.heading2),
              Container(
                height: 20,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.orange[600],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "$sisaPorsi Porsi Tersisa",
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [Text(namaToko, style: AppTextstyle.namaToko)]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [Text("Rp 15.000", style: AppTextstyle.harga)]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [Icon(Icons.timer_outlined), Text("PickUp : $pickUp")],
          ),
        ),
      ],
    ),
  );
}
