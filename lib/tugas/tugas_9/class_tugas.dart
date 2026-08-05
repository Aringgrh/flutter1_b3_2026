import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BuahModel {
  final String nama;
  final String deskripsi;
  final String gambar;
  BuahModel({
    required this.nama,
    required this.deskripsi,
    required this.gambar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
      'deskripsi': deskripsi,
      'gambar': gambar,
    };
  }

  factory BuahModel.fromMap(Map<String, dynamic> map) {
    return BuahModel(
      nama: map['nama'] as String,
      deskripsi: map['deskripsi'] as String,
      gambar: map['gambar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuahModel.fromJson(String source) =>
      BuahModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
