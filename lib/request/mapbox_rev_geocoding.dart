
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_mapbox_blog/constants/app_constants.dart';
// import 'package:flutter_mapbox_blog/helper/dio_exception';
// import 'package:mapbox_gl/mapbox_gl.dart';

// String baseUrl = 'https://api.mapbox.com/geocoding/v5/mapbox.places';
// String accessToken = AppConstants.mapBoxSecretToken;

// Dio _dio = Dio();

// Future getReverseGeocodingGivenLatLngUsingMapbox(LatLng latLng) async {
//   String query = '${latLng.longitude},${latLng.latitude}';
//   String url = '$baseUrl/$query.json?access_token=$accessToken';
//   url = Uri.parse(url).toString();
//   print(url);
//   try {
//     _dio.options.contentType = Headers.jsonContentType;
//     final responseData = await _dio.get(url);
//     return responseData.data;
//   } catch (e) {
//     final errorMessage = DioExceptions.fromDioError(e as DioError).toString();
//     debugPrint(errorMessage);
//   }
// }