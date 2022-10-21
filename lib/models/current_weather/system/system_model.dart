import 'package:json_annotation/json_annotation.dart';

part 'system_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SystemModel {
  @JsonKey(defaultValue: 0, name: 'type')
  int type;

  @JsonKey(defaultValue: 0, name: 'id')
  int id;

  @JsonKey(defaultValue: '', name: 'country')
  String country;

  @JsonKey(defaultValue: 0, name: 'sunrise')
  int sunRise;

  @JsonKey(defaultValue: 0, name: 'sunset')
  int sunSet;

  SystemModel({
    required this.type,
    required this.id,
    required this.country,
    required this.sunRise,
    required this.sunSet,
  });

  factory SystemModel.fromJson(Map<String, dynamic> json) =>
      _$SystemModelFromJson(json);

  Map<String, dynamic> toJson() => _$SystemModelToJson(this);
}
