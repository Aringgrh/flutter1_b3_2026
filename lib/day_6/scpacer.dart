import 'package:flutter/material.dart';

class ExpandedDay6 extends StatelessWidget {
  const ExpandedDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Expanded Day 6"),
      backgroundColor: Colors.white,
    ),
    
    body: Column(
      children: [
        Row(
          children: [
            Expanded(child: Container( color: Colors.red,)),
          ],
        ),
        
        Expanded(child: Container( color: Colors.red,)),
        Expanded(child: Container( color: Colors.white,)),
        Expanded(child: Container( color: Colors.blue,)),

      ],
    ),
    );
    

  }
}