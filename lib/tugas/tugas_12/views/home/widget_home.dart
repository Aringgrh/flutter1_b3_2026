import 'package:flutter/material.dart';

IconButton iconTitleHome({required Widget icon}) {
  return IconButton(onPressed: () {}, icon: icon);
}

Container pilihanKategori({
  double? width,
  IconData icon = Icons.fastfood,
  String text = 'All',
}) {
  return Container(
    height: 40,
    width: width,
    decoration: BoxDecoration(
      border: BoxBorder.all(),
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(icon), Text(text)],
      ),
    ),
  );
}
