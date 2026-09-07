import 'package:json_annotation/json_annotation.dart';

part 'profile_photo_response.g.dart';

@JsonSerializable()
class ProfilePhotoData {
  @JsonKey(name: "profile_photo")
  final String? profilePhoto;

  ProfilePhotoData({this.profilePhoto});

  factory ProfilePhotoData.fromJson(Map<String, dynamic> json) =>
      _$ProfilePhotoDataFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePhotoDataToJson(this);
}

@JsonSerializable()
class ProfilePhotoResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final ProfilePhotoData? data;

  ProfilePhotoResponse({this.message, this.data});

  factory ProfilePhotoResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfilePhotoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProfilePhotoResponseToJson(this);
}
