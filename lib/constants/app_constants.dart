import 'package:latlong2/latlong.dart';

class AppConstants {
  AppConstants._();
  static const String baseUrl =
      "https://api.mapbox.com/styles/v1/{id}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  static const String mapBoxAccessToken =
      'Your Access Token';
  static const String mapBoxSecretToken =
      'Your secret token';
  static const String mapBoxStyleId =
      'Your map box style id ';

  static const String iconMapMarker = 'assets/icons/map_marker.svg';

  static final myLocation = LatLng(36.19419044781102, 43.97013956272601);
}
