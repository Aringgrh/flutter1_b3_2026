import 'package:flutter/material.dart';

class DropDownTugas extends StatefulWidget {
  const DropDownTugas({super.key});

  @override
  State<DropDownTugas> createState() => DropDownTugasState();
}

class DropDownTugasState extends State<DropDownTugas> {
  String? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          dropDownWidget(),
          SizedBox(height: 20),
          Row(children: [Text("Menu yang kamu pilih adalah: "), Text(selected.toString())]),
        ],
      ),
    );
  }

  DropdownButtonFormField<String> dropDownWidget() {
    return DropdownButtonFormField(
      hint: Text("Pilih Menu"),
      initialValue: selected,
      items: ["Elektronik", "Pakaian", "Makanan"].map((String val) {
        return DropdownMenuItem(value: val, child: Text(val));
      }).toList(),
      onChanged: (value) {
        selected = value;
        setState(() {});
      },
    );
  }
}
