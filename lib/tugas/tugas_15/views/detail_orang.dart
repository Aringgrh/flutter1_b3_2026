import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter1_b3_2026/tugas/tugas_15/models/postt_models.dart';

class DetailOrang extends StatefulWidget {
  final PosttModels post;

  const DetailOrang({super.key, required this.post});

  @override
  State<DetailOrang> createState() => _DetailOrangState();
}

class _DetailOrangState extends State<DetailOrang> {
  @override
  Widget build(BuildContext context) {
    // Simpan ke variabel lokal agar tidak perlu mengetik 'widget.post' berulang kali
    final character = widget.post;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(character.fullName ?? 'Detail Karakter'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Cover
            Hero(
              tag: 'character_image_${character.id}',
              child: Container(
                height: 320,
                width: double.infinity,
                color: Colors.grey[200],
                child: CachedNetworkImage(
                  imageUrl: character.imageUrl ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                  errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.broken_image, size: 48, color: Colors.grey)),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.brown.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      (character.title ?? '-').toUpperCase(),
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    character.family ?? '-',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
