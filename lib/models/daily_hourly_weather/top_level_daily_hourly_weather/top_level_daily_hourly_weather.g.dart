// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_level_daily_hourly_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopLevelDailyHourlyWeather _$TopLevelDailyHourlyWeatherFromJson(
        Map<String, dynamic> json) =>
    TopLevelDailyHourlyWeather(
      daily: (json['daily'] as List<dynamic>?)
              ?.map((e) => DailyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      hourly: (json['hourly'] as List<dynamic>?)
              ?.map((e) => HourlyModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      timezone: json['timezone'] as String? ?? '',
      timezoneOffset: json['timezone_offset'] as int? ?? 0,
    );

Map<String, dynamic> _$TopLevelDailyHourlyWeatherToJson(
        TopLevelDailyHourlyWeather instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'hourly': instance.hourly,
      'daily': instance.daily,
    };
