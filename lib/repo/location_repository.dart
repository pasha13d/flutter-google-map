import 'package:google_map/api/location_api_client.dart';
import 'package:google_map/models/models.dart';

class LocationRepository {
  const LocationRepository({
    required LocationApiClient locationApiClient,
  }) : _locationApiClient = locationApiClient;

  final LocationApiClient _locationApiClient;

  /// get locations that matches given name
  Future<List<LocationDataModel>> getLocations({required String location}) async {
    final locations = <LocationDataModel>[];
    final locationsData =
      await _locationApiClient.getLocations(location: location);
    for(final data in locationsData) {
      locations.add(
        LocationDataModel.fromLocationData(data),
      );
    }
    return locations;
  }
}