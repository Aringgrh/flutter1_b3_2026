import 'package:flutter/material.dart';

class ProfilTugas8 extends StatelessWidget {
  const ProfilTugas8({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang Aplikasi"),
        backgroundColor: Colors.cyan,
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 250,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/fodos.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Text(
                            "Fodos",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(20),
                                right: Radius.circular(20),
                              ),
                            ),
                            child: Text("Versi 1.0.0"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.error_outline),
                        Text("Tentang Kami"),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        textAlign: TextAlign.justify,
                        "FODOS adalah platform yang menjembatani kelebihan makanan dari bisnis dengan konsumen yang peduli lingkungan. Kami membantu mengurangi limbah makanan sambil menyediakan akses makanan berkualitas dengan harga terjangkau.",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(children: [Text("Dibuat oleh : \nAhmad Ari NUgraha")]),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/ig.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("assets/images/waa.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
