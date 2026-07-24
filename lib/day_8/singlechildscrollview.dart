import 'package:flutter/material.dart';

class SingleDay8 extends StatelessWidget {
  const SingleDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Single Child Scroll View"),
        backgroundColor: Colors.greenAccent,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        // reverse: true,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Container(color: Colors.black, height: 400, width: 400),

                  Container(
                    height: 400,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(100),
                        topLeft: Radius.circular(100),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 5),
                    color: Colors.green,
                    height: 400,
                    width: 400,
                  ),
                ],
              ),
            ),
            Container(color: Colors.red, height: 400, width: 400),
            Container(color: Colors.yellow, height: 300, width: 300),
            Container(color: Colors.green, height: 200, width: 200),
          ],
        ),
      ),
    );
  }
}
