import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/current_weather/weather/weather_model.dart';
import 'package:weather_app/models/daily_hourly_weather/daily/feels_like/feels_like_model.dart';
import 'package:weather_app/models/daily_hourly_weather/daily/temp/temp_model.dart';

part 'daily_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DailyModel {
  @JsonKey(defaultValue: 0, name: 'dt')
  num dt;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  num sunrise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  num sunset;

  @JsonKey(defaultValue: 0, name: 'moonrise')
  num moonrise;

  @JsonKey(defaultValue: 0, name: 'moonset')
  num moonset;

  @JsonKey(defaultValue: 0.0, name: 'moon_phase')
  num moonPhase;

  @JsonKey(name: 'temp')
  TempModel temp;

  @JsonKey(name: 'feels_like')
  FeelsLikeModel feelsLike;

  @JsonKey(defaultValue: 0, name: 'pressure')
  num pressure;

  @JsonKey(defaultValue: 0, name: 'humidity')
  num humidity;

  @JsonKey(defaultValue: 0, name: 'dew_point')
  num dewPoint;

  @JsonKey(defaultValue: 0, name: 'wind_speed')
  num windSpeed;

  @JsonKey(defaultValue: 0, name: 'wind_deg')
  num windDeg;

  @JsonKey(defaultValue: 0, name: 'wind_gust')
  num windGust;

  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherModel> weather;

  @JsonKey(defaultValue: 0, name: 'clouds')
  int clouds;

  @JsonKey(defaultValue: 0, name: 'pop')
  num pop;

  @JsonKey(defaultValue: 0, name: 'uvi')
  num uvi;

  DailyModel({
    required this.clouds,
    required this.dewPoint,
    required this.dt,
    required this.feelsLike,
    required this.humidity,
    required this.moonPhase,
    required this.moonrise,
    required this.moonset,
    required this.pop,
    required this.pressure,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.uvi,
    required this.weather,
    required this.windDeg,
    required this.windGust,
    required this.windSpeed,
  });

  factory DailyModel.fromJson(Map<String, dynamic> json) =>
      _$DailyModelFromJson(json);

  Map<String, dynamic> toJson() => _$DailyModelToJson(this);
}
