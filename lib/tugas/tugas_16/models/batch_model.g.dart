// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchModel _$BatchModelFromJson(Map<String, dynamic> json) => BatchModel(
  id: (json['id'] as num?)?.toInt(),
  batchName: json['batch_name'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$BatchModelToJson(BatchModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'batch_name': instance.batchName,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

BatchListResponse _$BatchListResponseFromJson(Map<String, dynamic> json) =>
    BatchListResponse(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BatchListResponseToJson(BatchListResponse instance) =>
    <String, dynamic>{'message': instance.message, 'data': instance.data};
