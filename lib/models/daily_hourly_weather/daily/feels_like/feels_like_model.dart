import 'package:json_annotation/json_annotation.dart';

part 'feels_like_model.g.dart';

@JsonSerializable(explicitToJson: true)
class FeelsLikeModel {
  @JsonKey(defaultValue: 0, name: 'day')
  num day;

  @JsonKey(defaultValue: 0, name: 'night')
  num night;

  @JsonKey(defaultValue: 0, name: 'eve')
  num eve;

  @JsonKey(defaultValue: 0, name: 'morn')
  num morn;

  FeelsLikeModel({
    required this.day,
    required this.eve,
    required this.morn,
    required this.night,
  });

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) =>
      _$FeelsLikeModelFromJson(json);

  Map<String, dynamic> toJson() => _$FeelsLikeModelToJson(this);
}
