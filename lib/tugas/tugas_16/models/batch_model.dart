import 'package:json_annotation/json_annotation.dart';

part 'batch_model.g.dart';

@JsonSerializable()
class BatchModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "batch_name")
  final String? batchName;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  BatchModel({
    this.id,
    this.batchName,
    this.createdAt,
    this.updatedAt,
  });

  factory BatchModel.fromJson(Map<String, dynamic> json) {
    final model = _$BatchModelFromJson(json);
    return BatchModel(
      id: model.id ?? (json['id'] is int ? json['id'] as int? : int.tryParse(json['id']?.toString() ?? '')),
      batchName: model.batchName ??
          (json['batch_ke'] != null ? 'Batch ${json['batch_ke']}' : null) ??
          json['name']?.toString() ??
          json['title']?.toString(),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$BatchModelToJson(this);
}

@JsonSerializable()
class BatchListResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<BatchModel>? data;

  BatchListResponse({this.message, this.data});

  factory BatchListResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BatchListResponseToJson(this);
}
