import 'package:latlong2/latlong.dart';

class MapMarker {
  final String? image;
  final String? image2;
  final String? title;
  final String? address;
  final LatLng? location;

  MapMarker({
    this.image2,
    required this.image,
    required this.title,
    required this.address,
    required this.location,
  });
}

final mapMarkers = [
  MapMarker(
    image2: 'assets/icons/car_person.png',
    image: 'assets/icons/car.png',
    title: 'Shared rides with the option to walk',
    address: '8 Plender St, London NW1 0JT, United Kingdom',
    location: LatLng(36.19419044781102, 43.97013956272601),
  ),
  MapMarker(
    image2: 'assets/icons/car_person.png',
    image: 'assets/icons/car.png',
    title: 'Shared rides with the option to walk',
    address: 'IRAQ, Erbil  120 St \n Ganjan City',
    location: LatLng(36.19020748841493, 43.977006017827726),
  ),
  MapMarker(
    image2: 'assets/icons/car_person.png',
    image: 'assets/icons/car.png',
    title: 'Shared rides with the option to walk',
    address: 'IRAQ, Erbil  150 St \n Ganjan City',
    location: LatLng(36.203074982754025, 43.97350537294788),
  ),
  MapMarker(
    image: 'assets/icons/car.png',
    image2: 'assets/icons/car_person.png',
    title: 'Shared rides with the option to walk',
    address: 'IRAQ, Erbil  60 St \n Spanish village',
    location: LatLng(36.20176061673927, 43.99483232004824),
  ),
  MapMarker(
    image: 'assets/icons/car.png',
    image2: 'assets/icons/car_person.png',
    title: 'Shared rides with the option to walk',
    address: 'IRAQ, Erbil  100 St \n Italian village',
    location: LatLng(36.22596860627636, 44.00847988991298),
  ),
];
