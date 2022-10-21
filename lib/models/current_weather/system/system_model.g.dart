// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SystemModel _$SystemModelFromJson(Map<String, dynamic> json) => SystemModel(
      type: json['type'] as int? ?? 0,
      id: json['id'] as int? ?? 0,
      country: json['country'] as String? ?? '',
      sunRise: json['sunrise'] as int? ?? 0,
      sunSet: json['sunset'] as int? ?? 0,
    );

Map<String, dynamic> _$SystemModelToJson(SystemModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'country': instance.country,
      'sunrise': instance.sunRise,
      'sunset': instance.sunSet,
    };
