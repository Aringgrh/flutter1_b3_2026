import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/extention/extention.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/check.dart';
import 'package:flutter1_b3_2026/tugas/tugas_7/switch.dart';

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

  final List<Widget> _widgetOption = [CheckTugas7(), SwitchTugas7()];

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
              leading: Icon(Icons.check_box),
              title: Text("Check"),
              onTap: () {
                changeBottom(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Mode Gelap"),
              onTap: () {
                changeBottom(1);
              },
            ),
          ],
        ),
      ),
      body: _widgetOption.elementAt(_selected),
    );
  }
}
