import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:google_map/models/models.dart';

import '../constants/constants.dart';

/// Exception thrown when getLocations method fails
class GetLocationsRequestFailure implements Exception {}


/// Exception thrown LocationModel from json fails.
class GetLocationsDeserializationFailure implements Exception {}

///Location api client
class LocationApiClient {
  LocationApiClient({
    http.Client? httpClient
  }) : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;

  final _headers = {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  };

  /// get locations by name
  Future<List<LocationModel>> getLocations({required String location}) async {
    final queryParameters = {
      'access_key': Constants.apiKey,
      'query': location,
    };

    final uri = Uri.http(
      Constants.apiBaseUrl,
      Constants.forwardMethod,
      queryParameters,
    );

    final response = await _httpClient.get(
      uri,
      headers: _headers,
    );
    if(response.statusCode != 200) {
      throw GetLocationsRequestFailure();
    }

    final locations = <LocationModel>[];
    try {
      final dynamic jsonList =
      (jsonDecode(response.body) as Map<String, dynamic>)['data'];

      for(final jsonLocation in jsonList) {
        final location =
        LocationModel.fromJson(jsonLocation as Map<String, dynamic>);
        locations.add(location);
      }
      return locations;
    } catch (_) {
      throw GetLocationsDeserializationFailure();
    }
  }
}