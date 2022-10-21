// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyModel _$HourlyModelFromJson(Map<String, dynamic> json) => HourlyModel(
      dt: json['dt'] as int? ?? 0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      feelsLike: (json['feels_like'] as num?)?.toDouble() ?? 0.0,
      pressure: json['pressure'] as int? ?? 0,
      humidity: json['humidity'] as int? ?? 0,
      dewPoint: (json['dew_point'] as num?)?.toDouble() ?? 0.0,
      uvi: json['uvi'] as num? ?? 0,
      clouds: json['clouds'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      windDeg: json['wind_deg'] as int? ?? 0,
      windGust: (json['wind_gust'] as num?)?.toDouble() ?? 0.0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      pop: json['pop'] as num? ?? 0,
    );

Map<String, dynamic> _$HourlyModelToJson(HourlyModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'pop': instance.pop,
    };
