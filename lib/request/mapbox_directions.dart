// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_blog/constants/app_constants.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:flutter_mapbox_blog/helper/dio_exception';


// String baseUrl = 'https://api.mapbox.com/directions/v5/mapbox';
// String accessToken = AppConstants.mapBoxSecretToken;
// String navType = 'driving';

// Dio _dio = Dio();

// Future getCyclingRouteUsingMapbox(LatLng source, LatLng destination) async {
//   String url =
//       '$baseUrl/$navType/${source.longitude},${source.latitude};${destination.longitude},${destination.latitude}?alternatives=true&continue_straight=true&geometries=geojson&language=en&overview=full&steps=true&access_token=$accessToken';
//   try {
//     _dio.options.contentType = Headers.jsonContentType;
//     final responseData = await _dio.get(url);
//     return responseData.data;
//   } catch (e) {
//     final errorMessage = DioExceptions.fromDioError(e as DioException).toString();
//     debugPrint(errorMessage);
//   }
// }

