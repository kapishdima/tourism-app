import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:geolocator/geolocator.dart';

class MapService {
  static const String activeLocationKey = "active_location";

  static Marker createMarkerWithIcon(
      {required Location location,
      required BitmapDescriptor icon,
      required void Function() onTap,
      isActive = false}) {
    final MarkerId id = MarkerId(
        "${isActive ? activeLocationKey : ""}{location.lat}, ${location.lng}");
    return Marker(
      markerId: id,
      position: LatLng(location.lat, location.lng),
      icon: icon,
      onTap: () => onTap(),
    );
  }

  static CameraUpdate getDirectionBounds(Set<Marker> markers) {
    final highestLat =
        markers.map((marker) => marker.position.latitude).reduce(max);
    final highestLong =
        markers.map((marker) => marker.position.longitude).reduce(max);
    final lowestLat =
        markers.map((marker) => marker.position.latitude).reduce(min);
    final lowestLong =
        markers.map((marker) => marker.position.longitude).reduce(min);

    final lowestLatLowestLong = LatLng(lowestLat, lowestLong);
    final highestLatHighestLong = LatLng(highestLat, highestLong);

    return CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: lowestLatLowestLong,
        northeast: highestLatHighestLong,
      ),
      100,
    );
  }

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  static double toRadian(double value) => value * pi / 180;

  static double getDistanceBetweenPoints(LatLng start, LatLng finish) {
    double startLngInRadian = toRadian(start.longitude);
    double startLatInRadian = toRadian(start.latitude);
    double finishLngInRadian = toRadian(finish.longitude);
    double finishLatInRadian = toRadian(finish.latitude);
    const double radiusOfEarth = 6371;

    double deltaLng = startLngInRadian - finishLngInRadian;
    double deltaLat = startLatInRadian - finishLatInRadian;

    double a = pow(sin(deltaLat / 2), 2) +
        cos(startLatInRadian) *
            cos(finishLatInRadian * pow(sin(deltaLng / 2), 2));
    double c = 2 * asin(sqrt(a));

    return c * radiusOfEarth;
  }
}
