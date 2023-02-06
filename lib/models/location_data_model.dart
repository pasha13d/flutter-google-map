import 'package:google_map/models/models.dart';

/// LocationDataModell which include location: name, label, latitude, longitude
class LocationDataModel {
  /// const constructor of the LocationDataModel
  const LocationDataModel({
    required this.name,
    required this.label,
    required this.latitude,
    required this.longitude,
  });

  /// it returns LocationDataModel from json
  factory LocationDataModel.fromLocationData(LocationModel data) {
    return LocationDataModel(
      name: data.name,
      label: data.label,
      latitude: data.latitude,
      longitude: data.longitude,
    );
  }

  /// location name [String]
  final String name;

  /// location label [String]
  final String label;

  /// location latitude [double]
  final double latitude;

  /// location longitude [double]
  final double longitude;
}