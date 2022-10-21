import 'package:json_annotation/json_annotation.dart';

part 'clouds_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CloudsModel {
  @JsonKey(defaultValue: 0, name: 'all')
  int all;

  CloudsModel({required this.all});

  factory CloudsModel.fromJson(Map<String, dynamic> json) =>
      _$CloudsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CloudsModelToJson(this);
}
