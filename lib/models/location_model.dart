import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable(createToJson: false)
/// Location model which include location: name, label, latitude, longitude
class LocationModel {
  /// const constructor of the locationmodel
  const LocationModel({
    required this.name,
    required this.label,
    required this.latitude,
    required this.longitude,
  });

  /// it returns locationmodel from json
  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  /// location name [String]
  final String name;

  /// location label [String]
  final String label;

  /// location latitude [double]
  final double latitude;

  /// location longitude [double]
  final double longitude;
}