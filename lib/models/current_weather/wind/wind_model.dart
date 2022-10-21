import 'package:json_annotation/json_annotation.dart';

part 'wind_model.g.dart';

@JsonSerializable(explicitToJson: true)
class WindModel {
  @JsonKey(defaultValue: 0.0, name: 'speed')
  double speed;

  @JsonKey(defaultValue: 0, name: 'deg')
  int deg;

  WindModel({
    required this.deg,
    required this.speed,
  });

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);

  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
