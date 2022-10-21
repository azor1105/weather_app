import 'package:json_annotation/json_annotation.dart';

part 'temp_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TempModel {
  @JsonKey(defaultValue: 0, name: 'day')
  num day;

  @JsonKey(defaultValue: 0, name: 'min')
  num min;

  @JsonKey(defaultValue: 0, name: 'max')
  num max;

  @JsonKey(defaultValue: 0, name: 'night')
  num night;

  @JsonKey(defaultValue: 0, name: 'eve')
  num eve;

  @JsonKey(defaultValue: 0, name: 'morn')
  num morn;

  TempModel({
    required this.day,
    required this.eve,
    required this.max,
    required this.min,
    required this.morn,
    required this.night,
  });

  factory TempModel.fromJson(Map<String, dynamic> json) =>
      _$TempModelFromJson(json);

  Map<String, dynamic> toJson() => _$TempModelToJson(this);
}
