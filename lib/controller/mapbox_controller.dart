import 'dart:convert';
import 'package:flutter_mapbox_blog/constants/app_constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart' as latLng;

class MapboxDirectionsController extends GetxController {
  Position? position;
  MapboxMapController? mapController;
  List<LatLng> routeCoordinates = [];
  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void Function(MapboxMapController)? onMapCreated(
      MapboxMapController controller) {
    mapController = controller;
    update();
  }

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

    // Get the user's current location
    position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    update();
    print("This is my position************ $position****************");
    return position;
  }

  Future<void> calculateRoute(LatLng destination) async {
    if (mapController == null) return;
    final url = 'https://api.mapbox.com/directions/v5/mapbox/driving/'
            '${mapController!.cameraPosition!.target.longitude},${mapController!.cameraPosition!.target.latitude};'
            '${destination.longitude},${destination.latitude}?' +
        'alternatives=false&geometries=geojson&steps=true&access_token=${AppConstants.mapBoxAccessToken}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final route = data['routes'][0];
      final geometry = route['geometry']['coordinates'];

      routeCoordinates = List<LatLng>.from(
        geometry.map((point) => LatLng(point[1], point[0])),
      );
      drawRoute();
      update();
    }
  }

  void drawRoute() {
    if (mapController == null) return;
    mapController!.addLine(
      LineOptions(
        geometry: routeCoordinates,
        lineColor: '#747FF8',
        lineWidth: 3.0,
      ),
    );

    update();
  }

  void animatedMapMove(latLng.LatLng destLocation, double destZoom) {
    final cameraUpdate = CameraUpdate.newLatLngZoom(
      LatLng(destLocation.latitude, destLocation.longitude),
      destZoom,
    );

    mapController?.animateCamera(
      cameraUpdate,
    );

    update();
  }
}
