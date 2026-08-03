import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TanggalTugas extends StatefulWidget {
  const TanggalTugas({super.key});

  @override
  State<TanggalTugas> createState() => _TanggalTugasState();
}

class _TanggalTugasState extends State<TanggalTugas> {
  DateTime? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          tanggalWidget(context),
          Row(
            children: [
              Text("Tanggal Lahir: "),

              Text(
                (DateFormat("EE, dd MMMM yyyy", "id_ID").format(_selectedTime ?? DateTime.now())),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton tanggalWidget(BuildContext context) {
    return ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              initialDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() {
                _selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        );
  }
}
