import 'package:flutter/material.dart';

class ContainerDay6 extends StatelessWidget {
  const ContainerDay6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
      title: Text("Belajar Container Day 6"),),
      
      body: Column( children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            height: 100,
            width: 500,
            color: Colors.blue, 
            child: Text("Percobaan Penggunaan Container "),
            ),
        ),

        Container( height: 100, width: 400, color: Colors.orange,
          child: Column(children: [
            Text("Nama Saya Ari"),
            Text("Hobby Saya Ngoding"),
            Text("Saya Tinggal Di Indonesia"),
          ],),
        ), 
        Container( 
        margin:EdgeInsets.all(8), 
        height: 100, width: 400, 
        color: Colors.red,
        padding: EdgeInsets.all(16),
          child: Column(children: [
            Text("Nama Saya Ari"),
            Text("Hobby Saya Ngoding"),
            Text("Saya Tinggal Di Indonesia"),
          ],),
        ),

        Container( 
        margin:EdgeInsets.all(8), 
        height: 100, width: 400, 
        
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          // backgroundBlendMode: BlandMode.color
          border: Border.all(color: Colors.black, width: 2,  strokeAlign: 5 ),
          // borderRadius: BorderRadius.all(Radius.circular(20))
          borderRadius: BorderRadius.circular(20)
        ),
          child: Column(children: [
            Text("Nama Saya Ari"),
            Text("Hobby Saya Ngoding"),
            Text("Indonesia"),
          ],),
        ),

        Container( 
        margin:EdgeInsets.all(8), 
        height: 100, width: 400, 
        
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.red,
          // backgroundBlendMode: BlandMode.color
          border: Border.all(color: Colors.black, width: 2,  strokeAlign: 5 ),
          // borderRadius: BorderRadius.all(Radius.circular(20))
          borderRadius: BorderRadius.circular(20),
          // gradient: 
          // RadialGradient(color: [Colors.black]),
          // LinearGradient(colors: [Colors.black, Colors.white]),
          
          boxShadow: [
            BoxShadow(color: Colors.black, blurRadius: 50, offset: Offset(10, 20))
          ]
        ),
          child: Column(children: [
            Text("Nama Saya Ari"),
            Text("Hobby Saya Ngoding"),
            Text("Indonesia"),
          ],),
        ),    

      ],),
      );
  }
}