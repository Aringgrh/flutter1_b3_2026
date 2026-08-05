import 'package:flutter/material.dart';

class HomeAbalabalDay16 extends StatelessWidget {
  const HomeAbalabalDay16({super.key, required this.email, this.password});
  final String email;
  final String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Text(email), Text(password ?? "Tidak Ada Password")],
        ),
      ),
    );
  }
}
