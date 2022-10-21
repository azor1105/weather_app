import 'package:json_annotation/json_annotation.dart';

part 'main_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MainModel {
  @JsonKey(defaultValue: 0, name: 'temp')
  num temp;

  @JsonKey(defaultValue: 0, name: 'feels_like')
  num feelsLike;

  @JsonKey(defaultValue: 0, name: 'temp_min')
  num minTemp;

  @JsonKey(defaultValue: 0, name: 'temp_max')
  num maxTemp;

  @JsonKey(defaultValue: 0, name: 'pressure')
  num pressure;

  @JsonKey(defaultValue: 0, name: 'humidity')
  num humidity;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.minTemp,
    required this.maxTemp,
    required this.pressure,
    required this.humidity,
  });

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);
}
