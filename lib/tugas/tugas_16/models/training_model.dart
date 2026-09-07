import 'package:json_annotation/json_annotation.dart';

part 'training_model.g.dart';

@JsonSerializable()
class TrainingModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "participant_count")
  final dynamic participantCount;
  @JsonKey(name: "standard")
  final String? standard;
  @JsonKey(name: "duration")
  final String? duration;
  @JsonKey(name: "created_at")
  final String? createdAt;
  @JsonKey(name: "updated_at")
  final String? updatedAt;

  TrainingModel({
    this.id,
    this.title,
    this.description,
    this.participantCount,
    this.standard,
    this.duration,
    this.createdAt,
    this.updatedAt,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    final model = _$TrainingModelFromJson(json);
    return TrainingModel(
      id: model.id ?? (json['id'] is int ? json['id'] as int? : int.tryParse(json['id']?.toString() ?? '')),
      title: model.title ?? json['name']?.toString() ?? json['training_name']?.toString(),
      description: model.description,
      participantCount: model.participantCount,
      standard: model.standard,
      duration: model.duration,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
    );
  }

  Map<String, dynamic> toJson() => _$TrainingModelToJson(this);
}

@JsonSerializable()
class TrainingListResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final List<TrainingModel>? data;

  TrainingListResponse({this.message, this.data});

  factory TrainingListResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingListResponseToJson(this);
}

@JsonSerializable()
class TrainingDetailResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final TrainingModel? data;

  TrainingDetailResponse({this.message, this.data});

  factory TrainingDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$TrainingDetailResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingDetailResponseToJson(this);
}
