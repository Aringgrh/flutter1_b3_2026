import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/check.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/dropdown.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/home_tugas_7.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/switch.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/tanggal.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/time_picker.dart';

class Tugas7Flutter extends StatefulWidget {
  const Tugas7Flutter({super.key});

  @override
  State<Tugas7Flutter> createState() => _Tugas7FlutterState();
}

class _Tugas7FlutterState extends State<Tugas7Flutter> {
  int _selected = 0;
  void changeBottom(int index) {
    _selected = index;
    setState(() {
      context.pop();
    });
  }

  final List<Widget> _widgetOption = [
    HomeTugas7(),
    CheckTugas7(),
    SwitchTugas7(),
    DropDownTugas(),
    TanggalTugas(),
    TimePickerTugas(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Input Interaksi"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.cyan),
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/bandung.jpeg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.check_box),
              title: Text("Check Box"),
              onTap: () {
                changeBottom(1);
              },
            ),
            ListTile(
              leading: Icon(Icons.nightlight),
              title: Text("Mode Gelap"),
              onTap: () {
                changeBottom(2);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_drop_down),
              title: Text("Drop Down"),
              onTap: () {
                changeBottom(3);
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: Text("Pilih Tanggal"),
              onTap: () {
                changeBottom(4);
              },
            ),
            ListTile(
              leading: Icon(Icons.watch_later),
              title: Text("Pilih Jam"),
              onTap: () {
                changeBottom(5);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selected),
    );
  }
}
