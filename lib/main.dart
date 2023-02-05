import 'package:flutter/material.dart';
import 'package:google_map/api/location_api_client.dart';

void main() async {
  final locationApiClient = LocationApiClient();
  final locations = await locationApiClient.getLocations(location: 'Dhaka');
  final labels = <String>[];
  for(final location in locations) {
    labels.add(location.label);
  }
  print("Labels $labels");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
    );
  }
}


