import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputWidget13 extends StatefulWidget {
  const InputWidget13({super.key});

  @override
  State<InputWidget13> createState() => _InputWidget13State();
}

class _InputWidget13State extends State<InputWidget13> {
  bool _isCheck = false;
  bool _isOn = false;
  String? _selected;
  DateTime? _selectedTime;
  TimeOfDay? _selectedTimeOfDay;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: _isOn ? Colors.black : Colors.white,
      child: Column(
        children: [
          //checkbox
          checkBoxWidget(),
          //switch
          switchWidget(),
          //dropdwonfield
          dropdownfieldWidget(),
          //dropdown
          dropdownWidget(),
          //datepicker
          datepickerWidget(context),
          //time picker
          ElevatedButton(
            onPressed: () async {
              final TimeOfDay? picked = await showTimePicker(
                context: context,
                // firstDate: TimeOfDay(2021),
                // lastDate: TimeOfDay.now(),
                initialTime: TimeOfDay.now(),
              );
              if (picked != null) {
                setState(() {
                  _selectedTimeOfDay = picked;
                });
              }
            },
            child: Text("Pilih Jam"),
          ),
          Text(
            _selectedTimeOfDay == null
                ? "Anda Belum Pilih Jam"
                : _selectedTimeOfDay.toString(),
          ),
          Text(
            _selectedTimeOfDay == null
                ? "Anda belum pilih jam"
                : DateFormat('HH:mm a').format(
                    DateTime(
                      0,
                      0,
                      0,
                      _selectedTimeOfDay!.hour,
                      _selectedTimeOfDay!.minute,
                    ),
                  ),
          ),
          Text(
            _selectedTimeOfDay == null
                ? "Anda belum pilih jam"
                : DateFormat('HH:mm').format(
                    DateTime(
                      0,
                      0,
                      0,
                      _selectedTimeOfDay!.hour,
                      _selectedTimeOfDay!.minute,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Column datepickerWidget(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(2021),
              lastDate: DateTime.now(),
              initialDate: DateTime.now(),
            );
            if (picked != null) {
              setState(() {
                _selectedTime = picked;
              });
            }
          },
          child: Text("Pilih Tanggal"),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : _selectedTime.toString(),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : DateFormat('yyyy').format(_selectedTime ?? DateTime.now()),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : DateFormat(
                  'EEEE, dd MMMM yyyy',
                ).format(_selectedTime ?? DateTime.now()),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : DateFormat(
                  'EEE, dd MMMM yyyy',
                  "id_ID",
                ).format(_selectedTime ?? DateTime.now()),
        ),
        Text(
          _selectedTime == null
              ? "Anda Belum Pilih Tanggal"
              : DateFormat(
                  'EEE, d MMM yyyy',
                  'id_ID',
                ).format(_selectedTime ?? DateTime.now()),
        ),
      ],
    );
  }

  DropdownButtonFormField<String> dropdownfieldWidget() {
    return DropdownButtonFormField(
      initialValue: _selected,
      items: ["Merah", "Kuning", "Hijau"].map((String val) {
        return DropdownMenuItem(value: val, child: Text(val));
      }).toList(),
      onChanged: (value) {
        setState(() {
          _selected = value;
        });
      },
    );
  }

  Column dropdownWidget() {
    return Column(
      children: [
        DropdownButton(
          value: _selected,
          items: ["Merah", "Kuning", "Hijau"].map((String val) {
            return DropdownMenuItem(value: val, child: Text(val));
          }).toList(),
          onChanged: (value) {
            setState(() {
              _selected = value;
            });
          },
        ),
        Text(_selected.toString()),
        Container(
          height: 50,
          width: 50,
          color: _selected == "Merah"
              ? Colors.red
              : _selected == "Kuning"
              ? Colors.yellow
              : _selected == "Hijau"
              ? Colors.green
              : Colors.transparent,
        ),
      ],
    );
  }

  Column switchWidget() {
    return Column(
      children: [
        Switch(
          activeThumbColor: Colors.cyan,
          inactiveThumbColor: Colors.red,
          value: _isOn,
          onChanged: (value) {
            _isOn = value ?? false;
            setState(() {});
          },
        ),
        Text(
          _isOn ? "Matikan" : "Hidupkan",
          style: TextStyle(color: _isOn ? Colors.white : Colors.black),
        ),
      ],
    );
  }

  Column checkBoxWidget() {
    return Column(
      children: [
        Checkbox(
          value: _isCheck,
          onChanged: (value) {
            _isCheck = value ?? false;
            setState(() {});
          },
        ),
        Text(_isCheck ? "Sudah Diceklis" : "Belum Diceklis"),
      ],
    );
  }
}
