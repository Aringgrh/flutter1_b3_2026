import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/day_11/home_2.dart';

class SearchCoba extends StatefulWidget {
  const SearchCoba({super.key});

  @override
  State<SearchCoba> createState() => _SearchCobaState();
}

class _SearchCobaState extends State<SearchCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home2Day11()),
                    );
                  });
                },
                child: Icon(Icons.search, size: 20),
              ),
              Text(
                "Makan Apa Hari ini",
                style: TextStyle(
                  fontFamily: 'Arimo',
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
