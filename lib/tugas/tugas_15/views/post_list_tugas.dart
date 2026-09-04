import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/models/postt_models.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/services/apii_services.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/services/dioo_client.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/views/detail_orang.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/views/widget.dart';

class Tugas15PostList extends StatefulWidget {
  const Tugas15PostList({super.key});

  @override
  State<Tugas15PostList> createState() => _Tugas15PostListState();
}

class _Tugas15PostListState extends State<Tugas15PostList> {
  late final ApiService _apiService;
  late Future<List<PosttModels>> _postsFuture;

  @override
  void initState() {
    super.initState();
    // Inisialisasi Dio client & ApiService Retrofit saat widget dipasang
    final dio = buatDioClient();
    _apiService = ApiService(dio);
    // Memanggil API GET /posts
    _postsFuture = _apiService.getAllPosts();
  }

  // Method untuk memicu request ulang (refetch data)
  void _refreshPosts() {
    setState(() {
      _postsFuture = _apiService.getAllPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game Of Thrones", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.brown,
      ),
      body: FutureBuilder(
        future: _postsFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // State 1: Menunggu respon (Loading)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // State 2: Terjadi error saat request data
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.wifi_off, size: 64, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(
                      'Gagal memuat data:\n${snapshot.error}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.grey),
                    ), // Text
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _refreshPosts,
                      child: const Text('Coba Lagi'),
                    ), // ElevatedButton
                  ],
                ), // Column
              ), // Padding
            ); // Center
          }

          // State 3: Respon sukses tetapi data kosong
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Tidak ada data post.'));
          }

          // State 4: Data berhasil dimuat
          final List<PosttModels> posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return displaynama(
                image: post.imageUrl,
                title: post.title,
                fullname: post.fullName,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailOrang(post: post)),
                  ).then((_) => setState(() {}));
                },
              );
            },
          );
        },
      ),
    );
  }
}
