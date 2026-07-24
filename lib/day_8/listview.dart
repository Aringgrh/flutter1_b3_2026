import 'package:flutter/material.dart';

class ListViewDay8 extends StatelessWidget {
  const ListViewDay8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
        backgroundColor: Colors.greenAccent,
      ),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(childCount: 5),
      ),

      // ListView(
      //   children: [
      //     Container(color: Colors.red, height: 400, width: 400),
      //     Container(color: Colors.yellow, height: 300, width: 300),
      //     Container(color: Colors.green, height: 200, width: 200),
      //     Container(color: Colors.red, height: 400, width: 400),
      //     Container(color: Colors.yellow, height: 300, width: 300),
      //     Container(color: Colors.green, height: 200, width: 200),
      //   ],
      // ),
    );
  }
}
