import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_mapbox_blog/constants/app_constants.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latLng;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class MapboxDirections extends StatefulWidget {
  const MapboxDirections({super.key});

  @override
  _MapboxDirectionsState createState() => _MapboxDirectionsState();
}

class _MapboxDirectionsState extends State<MapboxDirections> {
  MapboxMapController? _mapController;
  List<LatLng> _routeCoordinates = [];
  late final MapController mapController;
  Position? position;
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print("This is my position************ $position****************");
    return position;
  }

  @override
  void initState() {
    mapController = MapController();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken: AppConstants.mapBoxAccessToken,
      onMapCreated: _onMapCreated,
      styleString: AppConstants.mapBoxStyleId,
      initialCameraPosition: CameraPosition(
        zoom: 10,
        target: LatLng(
          position?.latitude ?? 36.147940,
          position?.longitude ?? 44.028459,
        ),
      ),
      onMapClick: (point, coordinates) {
        _calculateRoute(const LatLng(36.292847, 44.048337));
        setState(() {
          _animatedMapMove(latLng.LatLng(36.292847, 44.048337), 10);
        });
      },
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  Future<void> _calculateRoute(LatLng destination) async {
    if (_mapController == null) return;
    final url = 'https://api.mapbox.com/directions/v5/mapbox/driving/'
            '${_mapController!.cameraPosition!.target.longitude},${_mapController!.cameraPosition!.target.latitude};'
            '${destination.longitude},${destination.latitude}?' +
        'alternatives=false&geometries=geojson&steps=true&access_token=${AppConstants.mapBoxAccessToken}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (kDebugMode) {}
      final route = data['routes'][0];
      final geometry = route['geometry']['coordinates'];

      setState(() {
        _routeCoordinates = List<LatLng>.from(
          geometry.map((point) => LatLng(point[1], point[0])),
        );
      });
      _drawRoute();
    }
  }

  void _drawRoute() {
    if (_mapController == null) return;
    _mapController!.addLine(
      LineOptions(
        geometry: _routeCoordinates,
        lineColor: '#747FF8',
        lineWidth: 3.0,
      ),
    );
  }

  void _animatedMapMove(latLng.LatLng destLocation, double destZoom) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(destLocation.latitude, destLocation.longitude),
      destZoom,
    );

    _mapController?.animateCamera(
      cameraUpdate,
    );
  }



}
