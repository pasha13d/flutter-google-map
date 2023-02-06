import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_map/bloc/map/map_bloc.dart';
import 'widgets/widgets.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MapBloc(),
      child: const _MapView(),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapBloc, MapState>(
      builder: (context, state) {
        return Scaffold(
          body: MapWidget(
            latitude: state.latitude,
            longitude: state.longitude,
          ),
        );
      },
    );
  }
}

