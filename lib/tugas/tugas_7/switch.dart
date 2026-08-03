import 'package:flutter/material.dart';

class SwitchTugas7 extends StatefulWidget {
  const SwitchTugas7({super.key});

  @override
  State<SwitchTugas7> createState() => _SwitchTugas7State();
}

class _SwitchTugas7State extends State<SwitchTugas7> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
     color:  _isOn ? Colors.white : Colors.black,child: Column(children: [Switch(
      value: _isOn,
      onChanged: (value) {
        _isOn = value ?? false;
        setState(() {});
      },);],)
    
    
    );
  }
}
