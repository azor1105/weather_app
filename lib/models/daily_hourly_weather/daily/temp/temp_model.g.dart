// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'temp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TempModel _$TempModelFromJson(Map<String, dynamic> json) => TempModel(
      day: json['day'] as num? ?? 0,
      eve: json['eve'] as num? ?? 0,
      max: json['max'] as num? ?? 0,
      min: json['min'] as num? ?? 0,
      morn: json['morn'] as num? ?? 0,
      night: json['night'] as num? ?? 0,
    );

Map<String, dynamic> _$TempModelToJson(TempModel instance) => <String, dynamic>{
      'day': instance.day,
      'min': instance.min,
      'max': instance.max,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
