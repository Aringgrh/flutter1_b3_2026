import 'package:flutter/material.dart';

class ScaffoldDay5 extends StatelessWidget {
  const ScaffoldDay5({super.key});

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
      spacing: 20,
      children:[Text("Hallo Arii"),Text("Hallo Arii"),
     Text("Hallo Arii"),Text("Hallo Arii"),Text("Hallo Arii"),Text("Hallo Arii"),
     Text("Hallo Arii")],
     ),
    );
  }
}