import 'package:flutter/material.dart';

class Tugas1 extends StatelessWidget {
  const Tugas1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Profil Saya"),
        centerTitle: true,),
        

        body:Column(
          children: [ Align(alignment: AlignmentGeometry.topCenter,),
          
            Icon(Icons.account_circle,size: 70,) , 
         
            Text("Ahmad Ari Nugraha",
              style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30
            ) ,
          ), 
         Row( mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Icon(Icons.location_on, ), 
          Text("Jakarta Timur, Indonesia")]),
          
          Text("Mahasiswa Semester 2 Sistem Informasi UPNVJ",
          style: TextStyle(
            fontSize: 20
          ),)
        ]
        ),
        
    );
  }
}