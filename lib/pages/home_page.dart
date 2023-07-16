import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mapbox_blog/constants/app_constants.dart';
import 'package:flutter_mapbox_blog/models/map_marker_model.dart';
import 'package:flutter_mapbox_blog/pages/common/custom_dialog.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_app_bar.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_bottom_home_page.dart';
import 'package:flutter_mapbox_blog/pages/widgets/custom_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageController = PageController();
  int selectedIndex = 0;
  var currentLocation = AppConstants.myLocation;
  List<latLng.LatLng> polylineCoordinates = [];
  Position? position;
  List<LatLng> _routeCoordinates = [];
  MapboxMapController? _mapController;
  bool? isLoading;
  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
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
            onMapClick: (point, coordinates) {},
          ),
          const CustomAppBar(),
          if (isLoading == true) const CustomDialog(),
          CustomBottomHomePage(
            onTap: () async {
              if (position != null) {
                _calculateRoute(LatLng(position!.latitude, position!.longitude),
                    const LatLng(36.292847, 44.048337));
                setState(() {
                  _animatedMapMove(latLng.LatLng(36.292847, 44.048337), 11.5);
                });
              } else {
                getCurrentLocation().then((value) async {
                  await _calculateRoute(
                      LatLng(position!.latitude, position!.longitude),
                      const LatLng(36.292847, 44.048337));
                  setState(() {
                    _animatedMapMove(latLng.LatLng(36.292847, 44.048337), 11.5);
                  });
                });
              }
            },
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 2.h,
            height: MediaQuery.of(context).size.height * 0.3,
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (value) {
                selectedIndex = value;
                currentLocation =
                    mapMarkers[value].location ?? AppConstants.myLocation;
                setState(() {});
              },
              itemCount: mapMarkers.length,
              itemBuilder: (_, index) {
                final item = mapMarkers[0];
                return CustomItem(
                  item: item,
                );
              },
            ),
          )
        ],
      ),
    );
  }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  Future<void> _calculateRoute(LatLng source, LatLng destination) async {
    isLoading = true;
    if (_mapController == null) return;
    final url = 'https://api.mapbox.com/directions/v5/mapbox/driving/'
            '${source.longitude},${source.latitude};'
            '${destination.longitude},${destination.latitude}?' +
        'alternatives=true&geometries=geojson&steps=true&access_token=${AppConstants.mapBoxAccessToken}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
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
    isLoading = false;
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

  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    isLoading = true;
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
    isLoading = false;
    setState(() {});
    print("This is my position************ $position****************");
    return position;
  }
}
