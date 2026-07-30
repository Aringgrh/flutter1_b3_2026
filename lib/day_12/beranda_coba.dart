import 'package:flutter/material.dart';

class BerandaCoba extends StatefulWidget {
  const BerandaCoba({super.key});

  @override
  State<BerandaCoba> createState() => _BerandaCobaState();
}

class _BerandaCobaState extends State<BerandaCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Hi Ariii"),
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red),
                Icon(Icons.notifications),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentGeometry.topCenter,
              children: [
                Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  // child: Image.asset(""),
                ),
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black,
                  ),
                  // child: Image.asset(""),
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  // child: Image.asset(""),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
