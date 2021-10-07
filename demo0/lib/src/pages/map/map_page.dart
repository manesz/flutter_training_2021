import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:demo0/src/constants/asset.dart';
import 'package:demo0/src/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  final Completer<GoogleMapController> _controller = Completer();
  StreamSubscription<LocationData>? _locationSubscription;
  final _locationService = Location();
  final Set<Marker> _markers = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          _dummyLocation();
        },

      ),
    );
  }

  Future<void> _dummyLocation() async {
    await Future.delayed(Duration(seconds: 2));

    List<LatLng> data = [
      LatLng(13.7330609, 100.5290547),
      LatLng(13.7304786, 100.5322757),
      LatLng(13.7286446, 100.5326617),
      LatLng(13.731132, 100.523406),
      LatLng(13.734506, 100.519914),
      LatLng(13.737904, 100.521985),
      LatLng(13.724373, 100.524751),
    ];

    for (var latLng in data) {
      await _addMarker(
        latLng,
        title: 'Rider009',
        snippet: 'Cat Lover',
        isShowInfo: true,
      );
    }

    _controller.future.then((controller) => controller.moveCamera(
        CameraUpdate.newLatLngBounds(_boundsFromLatLngList(data), 32)));
    setState(() {});
  }


  LatLngBounds _boundsFromLatLngList(List<LatLng> list) {
    double? x0, x1, y0, y1 = 0;
    for (LatLng latLng in list) {
      if (x0 == null) {
        x0 = x1 = latLng.latitude;
        y0 = y1 = latLng.longitude;
      } else {
        if (latLng.latitude > x1!) x1 = latLng.latitude;
        if (latLng.latitude < x0) x0 = latLng.latitude;
        if (latLng.longitude > y1!) y1 = latLng.longitude;
        if (latLng.longitude < y0!) y0 = latLng.longitude;
      }
    }
    return LatLngBounds(
      northeast: LatLng(x1!, y1!),
      southwest: LatLng(x0!, y0!),
    );
  }

  Future<void> _addMarker(
      LatLng position, {
        String title = 'none',
        String snippet = 'none',
        String pinAsset = Asset.pinBikerImage,
        bool isShowInfo = false,
      }) async {

    final Uint8List markerIcon = await getBytesFromAsset(
      pinAsset,
      width: 150,
    );

    final BitmapDescriptor bitmap = BitmapDescriptor.fromBytes(markerIcon);

    _markers.add(
      Marker(
        // important. unique id
        markerId: MarkerId(position.toString()),
        position: position,
        infoWindow: isShowInfo
            ? InfoWindow(
          title: title,
          snippet: snippet,
          // onTap: () => _launchMaps(
          //   lat: position.latitude,
          //   lng: position.longitude,onTap: () => _launchMaps(
          //           //   lat: position.latitude,
          //           //   lng: position.longitude,
          //           // ),
          // ),
        )
            : InfoWindow(),
        icon: bitmap,
        onTap: () async {
          //todo
        },
      ),
    );
  }

}
