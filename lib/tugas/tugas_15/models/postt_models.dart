import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

// File generasi otomatis yang dibuat oleh build_runner
part 'postt_models.g.dart';

// Helper function opsional untuk konversi JSON String ke List<PostModels>
List<PosttModels> postModelsFromJson(String str) =>
    List<PosttModels>.from(json.decode(str).map((x) => PosttModels.fromJson(x)));

String postModelsToJson(List<PosttModels> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PosttModels {
    @JsonKey(name: "id")
    final int id;
    @JsonKey(name: "firstName")
    final String firstName;
    @JsonKey(name: "lastName")
    final String lastName;
    @JsonKey(name: "fullName")
    final String fullName;
    @JsonKey(name: "title")
    final String title;
    @JsonKey(name: "family")
    final String family;
    @JsonKey(name: "image")
    final String image;
    @JsonKey(name: "imageUrl")
    final String imageUrl;

    PosttModels({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.fullName,
        required this.title,
        required this.family,
        required this.image,
        required this.imageUrl,
    });

    factory PosttModels.fromJson(Map<String, dynamic> json) => _$PosttModelsFromJson(json);

    Map<String, dynamic> toJson() => _$PosttModelsToJson(this);
}
