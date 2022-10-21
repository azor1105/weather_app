// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_level_current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopLevelCurrentWeather _$TopLevelCurrentWeatherFromJson(
        Map<String, dynamic> json) =>
    TopLevelCurrentWeather(
      coord: CoordModel.fromJson(json['coord'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      base: json['base'] as String? ?? '',
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      visibility: json['visibility'] as num? ?? 0,
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      clouds: CloudsModel.fromJson(json['clouds'] as Map<String, dynamic>),
      dt: json['dt'] as num? ?? 0,
      sys: SystemModel.fromJson(json['sys'] as Map<String, dynamic>),
      timezone: json['timezone'] as num? ?? 0,
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      cod: json['cod'] as int? ?? 0,
    );

Map<String, dynamic> _$TopLevelCurrentWeatherToJson(
        TopLevelCurrentWeather instance) =>
    <String, dynamic>{
      'coord': instance.coord.toJson(),
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'base': instance.base,
      'main': instance.main.toJson(),
      'visibility': instance.visibility,
      'wind': instance.wind.toJson(),
      'clouds': instance.clouds.toJson(),
      'dt': instance.dt,
      'sys': instance.sys.toJson(),
      'timezone': instance.timezone,
      'id': instance.id,
      'name': instance.name,
      'cod': instance.cod,
    };
