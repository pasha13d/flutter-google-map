import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latLong;
import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({
    Key? key,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  Widget build(BuildContext context) {
    final _searchingPoint = latLong.LatLng(
      latitude,
      longitude,
    );
    return FlutterMap(
      options: MapOptions(
        center: _searchingPoint,
        zoom: 11,
        keepAlive: true,
      ),
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}