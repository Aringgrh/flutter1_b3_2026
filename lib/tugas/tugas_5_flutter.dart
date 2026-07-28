import 'package:flutter/material.dart';

class Tugas5Flutter extends StatefulWidget {
  const Tugas5Flutter({super.key});

  @override
  State<Tugas5Flutter> createState() => _Tugas5FlutterState();
}

class _Tugas5FlutterState extends State<Tugas5Flutter> {
  bool elevated = true;
  bool like = true;
  bool deskripsi = true;
  bool sentuh = true;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interaksi Flutter"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ],
          ),
          Text("Ini Tentang ElevatedButton"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                elevated = !elevated;
              });
            },
            child: Text("Klik Saya!"),
          ),
          if (elevated) const Text("Hallo Saya Developer"),

          SizedBox(height: 20),
          Text("Ini Tentang IconButton"),
          IconButton(
            icon: Icon(
              Icons.favorite,
              color: like ? Colors.red : Colors.grey,
              size: 100,
            ),
            onPressed: () {
              setState(() {
                like = !like;
              });
            },
          ),
          if (like) const Text("Sudah Dilike") else const Text("Belum Dilike"),
          SizedBox(height: 20),
          Text("Ini Tentang textButton"),
          TextButton(
            onPressed: () {
              setState(() {
                deskripsi = !deskripsi;
              });
            },
            child: Text(
              "Lihat Deskripsi",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            ),
          ),
          if (deskripsi)
            const Text(
              "Deskripsi adalah pemaparan, penggambaran, atau uraian dengan kata-kata secara jelas dan terperinci mengenai suatu objek, tempat, orang, atau peristiwa. ",
            ),
          SizedBox(height: 20),
          Text("Ini Tentang inkWell"),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              setState(() {
                sentuh = !sentuh;
                print("Tombol Ditekan");
              });
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Sentuh Kotak Ini",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (sentuh) const Text("Sentuh Terdeteksi"),
          SizedBox(height: 20),

          GestureDetector(
            onTap: () {
              setState(() {
                counter++;
              });
              print("Disentuh Sekali");
            },
            onDoubleTap: () {
              setState(() {
                counter += 2;
              });
              print("Disentuh Dua Kali");
            },
            onLongPress: () {
              setState(() {
                counter += 3;
              });
              print("Tahan Lama");
            },
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                counter.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Text("-Tap = +1\n-Double Tap = +2\n-Long Press = +3"),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    print("FAB Ditekan");
                    counter--;
                  });
                },
                tooltip: "Kurang Data",
                child: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
