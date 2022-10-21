import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/current_weather/clouds/clouds_model.dart';
import 'package:weather_app/models/current_weather/coord/coord_model.dart';
import 'package:weather_app/models/current_weather/main/main_model.dart';
import 'package:weather_app/models/current_weather/system/system_model.dart';
import 'package:weather_app/models/current_weather/weather/weather_model.dart';
import 'package:weather_app/models/current_weather/wind/wind_model.dart';

part 'top_level_current_weather.g.dart';

@JsonSerializable(explicitToJson: true)
class TopLevelCurrentWeather {
  @JsonKey(name: 'coord')
  CoordModel coord;

  @JsonKey(defaultValue: [], name: 'weather')
  List<WeatherModel> weather;

  @JsonKey(defaultValue: '', name: 'base')
  String base;

  @JsonKey(name: 'main')
  MainModel main;

  @JsonKey(defaultValue: 0, name: 'visibility')
  num visibility;

  @JsonKey(name: 'wind')
  WindModel wind;

  @JsonKey(name: 'clouds')
  CloudsModel clouds;

  @JsonKey(defaultValue: 0, name: 'dt')
  num dt;

  @JsonKey(name: 'sys')
  SystemModel sys;

  @JsonKey(defaultValue: 0, name: 'timezone')
  num timezone;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'name')
  String name;

  @JsonKey(defaultValue: 0, name: 'cod')
  int cod;

  TopLevelCurrentWeather({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory TopLevelCurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$TopLevelCurrentWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$TopLevelCurrentWeatherToJson(this);
}
