import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeTugas7 extends StatefulWidget {
  const HomeTugas7({super.key});

  @override
  State<HomeTugas7> createState() => _HomeTugas7State();
}

class _HomeTugas7State extends State<HomeTugas7> {
  bool isCheck = false;
  bool _isOn = false;
  String? selected;
  TimeOfDay? _selected;
  DateTime? _selectedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: _isOn ? Colors.black : Colors.white),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Ceklis Persetujuan"), checkBox()],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Pilih Tema"), switchWidget()],
            ),
            dropDownWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Pilih Waktu"), timerWidget(context)],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Pilih Tanggal"), tanggalWidget(context)],
            ),
            SizedBox(height: 20),

            Text("Result", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10)),
                Text("Status Pendaftaran: ", style: TextStyle(fontSize: 16)),
                Text(
                  isCheck ? "Pendaftaran diperbolehkan " : "Pendaftaran Belum Tersedia",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10)),
                Text("Mode Gelap: ", style: TextStyle(fontSize: 16)),
                Text(_isOn ? "aktif" : "Mati", style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10)),
                Text("Menu yang kamu pilih adalah: ", style: TextStyle(fontSize: 16)),
                Text(selected.toString(), style: TextStyle(fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10)),
                Text("Pengingat Di atur Pukul: ", style: TextStyle(fontSize: 16)),
                Text(
                  style: TextStyle(fontSize: 16),
                  _selected == null
                      ? "Anda belum pilih jam"
                      : DateFormat(
                          'HH:mm a',
                        ).format(DateTime(0, 0, 0, _selected!.hour, _selected!.minute)),
                ),
              ],
            ),
            Row(
              children: [
                Padding(padding: EdgeInsetsGeometry.symmetric(vertical: 20, horizontal: 10)),
                Text("Tanggal Lahir: ", style: TextStyle(fontSize: 16)),
                Text(
                  (DateFormat("EE, dd MMMM yyyy", "id_ID").format(_selectedTime ?? DateTime.now())),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Checkbox checkBox() {
    return Checkbox(
      value: isCheck,
      onChanged: (value) {
        isCheck = value ?? false;
        setState(() {});
      },
    );
  }

  Switch switchWidget() {
    return Switch(
      value: _isOn,
      onChanged: (value) {
        _isOn = value ?? false;
        setState(() {});
      },
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
