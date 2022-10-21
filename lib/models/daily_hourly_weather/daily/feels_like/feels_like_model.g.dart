// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feels_like_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeelsLikeModel _$FeelsLikeModelFromJson(Map<String, dynamic> json) =>
    FeelsLikeModel(
      day: json['day'] as num? ?? 0,
      eve: json['eve'] as num? ?? 0,
      morn: json['morn'] as num? ?? 0,
      night: json['night'] as num? ?? 0,
    );

Map<String, dynamic> _$FeelsLikeModelToJson(FeelsLikeModel instance) =>
    <String, dynamic>{
      'day': instance.day,
      'night': instance.night,
      'eve': instance.eve,
      'morn': instance.morn,
    };
