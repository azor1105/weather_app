import 'package:json_annotation/json_annotation.dart';

part 'coord_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CoordModel {
  @JsonKey(defaultValue: 0.0, name: 'lon')
  double lon;

  @JsonKey(defaultValue: 0.0, name: 'lat')
  double lat;

  CoordModel({
    required this.lon,
    required this.lat,
  });

  factory CoordModel.fromJson(Map<String, dynamic> json) =>
      _$CoordModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoordModelToJson(this);
}
