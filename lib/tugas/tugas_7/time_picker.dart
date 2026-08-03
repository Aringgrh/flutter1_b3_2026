import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimePickerTugas extends StatefulWidget {
  const TimePickerTugas({super.key});

  @override
  State<TimePickerTugas> createState() => _TimePickerTugasState();
}

class _TimePickerTugasState extends State<TimePickerTugas> {
  TimeOfDay? _selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          timerWidget(context),
          Row(
            children: [
              Text("Pengingat diatur Pukul: "),
              Text(
                _selected == null
                    ? "Anda belum pilih jam"
                    : DateFormat(
                        'HH:mm a',
                      ).format(DateTime(0, 0, 0, _selected!.hour, _selected!.minute)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ElevatedButton timerWidget(BuildContext context) {
    return ElevatedButton(
          onPressed: () async {
            final TimeOfDay? picked = await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
            if (picked != null) {
              setState(() {
                _selected = picked;
              });
            }
          },
          child: Text("Pilih Waktu"),
        );
  }
}
