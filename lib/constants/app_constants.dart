import 'package:latlong2/latlong.dart';

class AppConstants {
  AppConstants._();
  static const String baseUrl =
      "https://api.mapbox.com/styles/v1/{id}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}";
  static const String mapBoxAccessToken =
      'pk.eyJ1IjoieWFzZXJnaCIsImEiOiJjbGo1d3Mzb3AwMnJwM2ZxcGVkMDhzMHRkIn0.mEHt3jSDktGIzG1_JQgvBQ';
  static const String mapBoxSecretToken =
      'sk.eyJ1IjoieWFzZXJnaCIsImEiOiJjbGsya3plM3UwZmhuM2RwMnFxZmd4eGZqIn0.EBTKHycZO6UHPcPbPHZwjg';
  static const String mapBoxStyleId =
      'mapbox://styles/yasergh/clj5wy8fh004f01pig8p4gr6r';

  static const String iconMapMarker = 'assets/icons/map_marker.svg';

  static final myLocation = LatLng(36.19419044781102, 43.97013956272601);
}
