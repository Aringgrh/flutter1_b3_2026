import 'package:flutter/material.dart';

class StylingDay5 extends StatelessWidget {
  const StylingDay5({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(
      backgroundColor: Colors.blueGrey,
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
        Text("Hallo Ariii", 
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.wavy,
          decorationColor: Colors.red,
          backgroundColor: const Color.fromARGB(255, 207, 204, 204)
          ),
        ),
        
        
        Row(children: [Icon(Icons.star), Text("Hello World")])
     ],
     ),
    );
  }
}