// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrainingModel _$TrainingModelFromJson(Map<String, dynamic> json) =>
    TrainingModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      participantCount: json['participant_count'],
      standard: json['standard'] as String?,
      duration: json['duration'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TrainingModelToJson(TrainingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'participant_count': instance.participantCount,
      'standard': instance.standard,
      'duration': instance.duration,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

TrainingListResponse _$TrainingListResponseFromJson(
  Map<String, dynamic> json,
) => TrainingListResponse(
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => TrainingModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TrainingListResponseToJson(
  TrainingListResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};

TrainingDetailResponse _$TrainingDetailResponseFromJson(
  Map<String, dynamic> json,
) => TrainingDetailResponse(
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : TrainingModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TrainingDetailResponseToJson(
  TrainingDetailResponse instance,
) => <String, dynamic>{'message': instance.message, 'data': instance.data};
