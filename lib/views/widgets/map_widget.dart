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
    return FlutterMap(
      options: MapOptions(
        center: latLong.LatLng(51.509364, -0.128928),
        zoom: 9.2,
      ),
      nonRotatedChildren: [
        AttributionWidget.defaultWidget(
          source: 'OpenStreetMap contributors',
          onSourceTapped: null,
        ),
      ],
      children: [
        TileLayer(
          urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          userAgentPackageName: 'com.example.app',
        ),
      ],
    );
  }
}
