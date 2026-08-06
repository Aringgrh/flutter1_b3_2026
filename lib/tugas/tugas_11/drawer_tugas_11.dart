import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_13/bussines.dart';
import 'package:flutter1_b3_2026/day_13/login.dart';
import 'package:flutter1_b3_2026/day_13/school.dart';
import 'package:flutter1_b3_2026/day_15/list.dart';
import 'package:flutter1_b3_2026/day_15/listofmap.dart';
import 'package:flutter1_b3_2026/day_16/text_form_field.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/input_widget/check_box.dart';
import 'package:flutter1_b3_2026/service/preference_handler.dart';
import 'package:flutter1_b3_2026/tugas/tugas_5_flutter.dart';
import 'package:flutter1_b3_2026/tugas/tugas_9/list_level_1.dart';
import 'package:flutter1_b3_2026/tugas/tugas_9/list_level_2.dart';
import 'package:flutter1_b3_2026/tugas/tugas_9/tugas_9_flutter.dart';

class DrawerTugas11 extends StatefulWidget {
  const DrawerTugas11({super.key});

  @override
  State<DrawerTugas11> createState() => _DrawerTugas11State();
}

class _DrawerTugas11State extends State<DrawerTugas11> {
  int _selectedBottom = 0;
  void changeBottom(int index) {
    _selectedBottom = index;
    print("Ini Adalah value dari $_selectedBottom");
    setState(() {});
    context.pop();
  }

  final List<Widget> _widgetOption = [
    Tugas5Flutter(),
    SchoolDay13(),
    BussinesDay13(),
    InputWidget13(),
    HalamanLogin(),
    ListDataDay15(),
    ListOfMapDay15(),
    ListOfMapDay15(),
    Tugas9Flutter(),
    ListLevel2(),
    ListLevenl1(),
    TextFormFieldDay16(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Drawer")),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.school),
              title: Text("School"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.business),
              title: Text("Bussines"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.input),
              title: Text("Input Widget"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.output, color: Colors.red),
              title: Text("Keluar", style: TextStyle(color: Colors.red)),
              onTap: () {
                PreferenceHandler.logOut();
                context.pushAndRemoveAll(const HalamanLogin());
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List Data"),
              onTap: () {
                changeBottom(5);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List Of Map"),
              onTap: () {
                changeBottom(6);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List Of Model"),
              onTap: () {
                changeBottom(7);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("Tugas 9 Flutter"),
              onTap: () {
                changeBottom(8);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List"),
              onTap: () {
                changeBottom(9);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("List"),
              onTap: () {
                changeBottom(10);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("TExt Form Field"),
              onTap: () {
                changeBottom(11);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text("TExt Form Field"),
              onTap: () {
                changeBottom(12);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selectedBottom),
    );
  }
}
