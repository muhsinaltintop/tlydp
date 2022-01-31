// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(53.48162403393671, -2.246810274184781);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: MinMaxZoomPreference(8, 20),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
    ));
  }
}
