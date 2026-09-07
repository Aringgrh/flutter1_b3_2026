import 'package:json_annotation/json_annotation.dart';
import 'user_model.dart';

part 'user_list_response.g.dart';

@JsonSerializable()
class UserListResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<UserModel>? data;

  UserListResponse({this.message, this.data});

  factory UserListResponse.fromJson(Map<String, dynamic> json) =>
      _$UserListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserListResponseToJson(this);
}
