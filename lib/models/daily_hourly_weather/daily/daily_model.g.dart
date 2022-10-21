// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyModel _$DailyModelFromJson(Map<String, dynamic> json) => DailyModel(
      clouds: json['clouds'] as int? ?? 0,
      dewPoint: json['dew_point'] as num? ?? 0,
      dt: json['dt'] as num? ?? 0,
      feelsLike:
          FeelsLikeModel.fromJson(json['feels_like'] as Map<String, dynamic>),
      humidity: json['humidity'] as num? ?? 0,
      moonPhase: json['moon_phase'] as num? ?? 0.0,
      moonrise: json['moonrise'] as num? ?? 0,
      moonset: json['moonset'] as num? ?? 0,
      pop: json['pop'] as num? ?? 0,
      pressure: json['pressure'] as num? ?? 0,
      sunrise: json['sunrise'] as num? ?? 0,
      sunset: json['sunset'] as num? ?? 0,
      temp: TempModel.fromJson(json['temp'] as Map<String, dynamic>),
      uvi: json['uvi'] as num? ?? 0,
      weather: (json['weather'] as List<dynamic>?)
              ?.map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      windDeg: json['wind_deg'] as num? ?? 0,
      windGust: json['wind_gust'] as num? ?? 0,
      windSpeed: json['wind_speed'] as num? ?? 0,
    );

Map<String, dynamic> _$DailyModelToJson(DailyModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'moonrise': instance.moonrise,
      'moonset': instance.moonset,
      'moon_phase': instance.moonPhase,
      'temp': instance.temp.toJson(),
      'feels_like': instance.feelsLike.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'wind_gust': instance.windGust,
      'weather': instance.weather.map((e) => e.toJson()).toList(),
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
    };
