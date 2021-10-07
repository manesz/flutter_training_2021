import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

// 13.7462463,100.5325515,17z
class _MapPageState extends State<MapPage> {
  static const CameraPosition _initMap = CameraPosition(
    target: LatLng(13.7462463, 100.5325515),
    zoom: 20,
  );

  StreamSubscription<LocationData>? _locationSubscription;
  final _locationService = Location();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(Marker(
      // important. unique id
      markerId: MarkerId("1"),
      position: LatLng(13.7462463, 100.5325515),
      onTap: () async {
        //todo
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: GoogleMap(
        markers: _markers,
        mapType: MapType.hybrid,
        initialCameraPosition: _initMap,
      ),
    );
  }
}
