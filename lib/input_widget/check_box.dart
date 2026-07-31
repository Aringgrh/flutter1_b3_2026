import 'package:flutter/material.dart';

class InputWidget13 extends StatefulWidget {
  const InputWidget13({super.key});

  @override
  State<InputWidget13> createState() => _InputWidget13State();
}

class _InputWidget13State extends State<InputWidget13> {
  bool _isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
        ),
      ],
    );
  }
}
