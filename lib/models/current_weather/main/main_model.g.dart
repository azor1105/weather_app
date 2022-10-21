// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainModel _$MainModelFromJson(Map<String, dynamic> json) => MainModel(
      temp: json['temp'] as num? ?? 0,
      feelsLike: json['feels_like'] as num? ?? 0,
      minTemp: json['temp_min'] as num? ?? 0,
      maxTemp: json['temp_max'] as num? ?? 0,
      pressure: json['pressure'] as num? ?? 0,
      humidity: json['humidity'] as num? ?? 0,
    );

Map<String, dynamic> _$MainModelToJson(MainModel instance) => <String, dynamic>{
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'temp_min': instance.minTemp,
      'temp_max': instance.maxTemp,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
    };
