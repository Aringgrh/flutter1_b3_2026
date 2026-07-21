import 'package:flutter/material.dart';

class LayoutingDay5 extends StatelessWidget {
  const LayoutingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      backgroundColor: Colors.green,
      title: Text("Hallo Arii"),
      centerTitle: true, 
      actions: 
      [Text("1"),Text("2")],
      leading: Icon(Icons.arrow_back),
     ) ,
     body:Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 50
      ,
      children:[
        Text("Hallo Arii"),
        Text("Hallo Arii"),
        Icon(Icons.star),
        Text("Hallo Arii"),
        Text("Hallo Arii"),
        Row(children: [Icon(Icons.star), Text("Hello World")])
     ],
     ),
    );
  }
}