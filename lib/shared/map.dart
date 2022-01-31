// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../model/ducks.dart' as ducks;

class CustomMap extends StatefulWidget {
  const CustomMap({Key? key}) : super(key: key);

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late GoogleMapController mapController;
  final Map<String, Marker> _markers = {};
  final LatLng _center = const LatLng(53.48162403393671, -2.246810274184781);

  Future<void> _onMapCreated(GoogleMapController controller) async {
    final foundDucks = await ducks.getFoundDucks();
    BitmapDescriptor markerbitmap = await BitmapDescriptor.fromAssetImage(
    ImageConfiguration(),
    "assets/images/outlined-duck-icon.png",
);


    setState(() {
      _markers.clear();
      for (final duck in foundDucks) {
        final marker = Marker(
          markerId: MarkerId(duck.duck_id.toString()),
          icon: markerbitmap,
          position: LatLng(duck.location_found_lat, duck.location_found_lng),
          infoWindow: InfoWindow(
            title: duck.duck_name,
            snippet: 'Comments: ${duck.comments}, By ${duck.finder_name}',
          ),
        );
        _markers[duck.duck_id.toString()] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      minMaxZoomPreference: MinMaxZoomPreference(1, 20),
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 11.0,
      ),
      markers: _markers.values.toSet(),
    ));
  }
}
