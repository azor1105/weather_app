import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/current_weather/weather/weather_model.dart';

part 'hourly_model.g.dart';

@JsonSerializable(explicitToJson: true)
class HourlyModel {
  @JsonKey(defaultValue: 0, name: 'dt')
  int dt;

  @JsonKey(defaultValue: 0.0, name: 'temp')
  double temp;

  @JsonKey(defaultValue: 0.0, name: 'feels_like')
  double feelsLike;

  @JsonKey(defaultValue: 0, name: 'pressure')
  int pressure;

  @JsonKey(defaultValue: 0, name: 'humidity')
  int humidity;

  @JsonKey(defaultValue: 0.0, name: 'dew_point')
  double dewPoint;

  @JsonKey(defaultValue: 0, name: 'uvi')
  num uvi;

  @JsonKey(defaultValue: 0, name: 'clouds')
  int clouds;

  @JsonKey(defaultValue: 0, name: 'visibility')
  int visibility;

  @JsonKey(defaultValue: 0.0, name: 'wind_speed')
  double windSpeed;

  @JsonKey(defaultValue: 0, name: 'wind_deg')
  int windDeg;

  @JsonKey(defaultValue: 0.0, name: 'wind_gust')
  double windGust;

  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherModel> weather;

  @JsonKey(defaultValue: 0, name: 'pop')
  num pop;

  HourlyModel({
    required this.dt,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.pop,
  });

  factory HourlyModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyModelToJson(this);
}
