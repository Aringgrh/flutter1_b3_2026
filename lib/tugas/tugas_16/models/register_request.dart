import 'package:json_annotation/json_annotation.dart';

part 'register_request.g.dart';

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "email")
  final String email;
  @JsonKey(name: "password")
  final String password;
  @JsonKey(name: "jenis_kelamin")
  final String? jenisKelamin;
  @JsonKey(name: "profile_photo")
  final String? profilePhoto;
  @JsonKey(name: "batch_id")
  final int? batchId;
  @JsonKey(name: "training_id")
  final int? trainingId;

  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    this.jenisKelamin,
    this.profilePhoto,
    this.batchId,
    this.trainingId,
  });

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
