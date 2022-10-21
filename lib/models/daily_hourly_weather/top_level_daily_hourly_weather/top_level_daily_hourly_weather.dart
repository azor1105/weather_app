import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/models/daily_hourly_weather/daily/daily_model.dart';
import 'package:weather_app/models/daily_hourly_weather/hourly/hourly_model.dart';

part 'top_level_daily_hourly_weather.g.dart';

@JsonSerializable(explicitToJson: false)
class TopLevelDailyHourlyWeather {
  @JsonKey(defaultValue: 0.0, name: 'lat')
  double lat;

  @JsonKey(defaultValue: 0.0, name: 'lon')
  double lon;

  @JsonKey(defaultValue: '', name: 'timezone')
  String timezone;

  @JsonKey(defaultValue: 0, name: 'timezone_offset')
  int timezoneOffset;

  @JsonKey(defaultValue: [], name: 'hourly')
  List<HourlyModel> hourly;

  @JsonKey(defaultValue: [], name: 'daily')
  List<DailyModel> daily;

  TopLevelDailyHourlyWeather({
    required this.daily,
    required this.hourly,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
  });

  factory TopLevelDailyHourlyWeather.fromJson(Map<String, dynamic> json) =>
      _$TopLevelDailyHourlyWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$TopLevelDailyHourlyWeatherToJson(this);
}
