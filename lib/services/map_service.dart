import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/lib/get_marker_icon.dart';

class MapService {
  late PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  Future<Map<PolylineId, Polyline>> createPolylines(
      {required LatLng origin,
      required LatLng destination,
      required List<String> waypoints}) async {
    polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAsog6n2FPsc0Q3hXUzXYAGLMPIaR7_r9A",
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
      wayPoints: waypoints
          .map((waypoint) => PolylineWayPoint(location: waypoint))
          .toList(),
    );

    if (result.points.isEmpty) {
      throw Exception("Direction not found");
    }

    for (var point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }

    PolylineId id = PolylineId('${origin.latitude}.${origin.longitude}.');

    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.dark,
      points: polylineCoordinates,
      width: 1,
    );

    polylines[id] = polyline;

    return polylines;
  }

  Future<Set<Marker>> createMarkerWithIcon(
      {required List<Location> locations,
      required Map<String, double>? dimensions,
      required void Function(Location) onTap}) async {
    Set<Marker> markersWithIcon = {};

    for (var location in locations) {
      BitmapDescriptor icon = await getMarkerIcon(
        path: location.icon,
        width: dimensions?["width"] ?? 20,
        height: dimensions?["height"] ?? 20,
      );

      Marker marker = Marker(
        markerId: MarkerId(location.entity.name),
        position: LatLng(location.lat, location.lng),
        icon: icon,
        onTap: () {
          onTap(location);
        },
      );

      markersWithIcon.add(marker);
    }

    return markersWithIcon;
  }

  Future<Marker> createStartMarker(
      {required Location location,
      required Map<String, double> dimensions,
      required void Function(Location) onTap}) async {
    BitmapDescriptor icon = await getMarkerIcon(
      path: "assets/icons/locations/start_icon.svg",
      width: dimensions["width"]!,
      height: dimensions["height"]!,
    );

    return Marker(
      markerId: MarkerId(location.entity.name),
      position: LatLng(location.lat, location.lng),
      icon: icon,
      onTap: () {
        onTap(location);
      },
    );
  }

  Future<Marker> createFinishMarker(
      {required Location location,
      required Map<String, double>? dimensions,
      required void Function(Location) onTap}) async {
    BitmapDescriptor icon = await getMarkerIcon(
      path: "assets/icons/locations/finish_icon.svg",
      width: dimensions?["width"] ?? 20,
      height: dimensions?["height"] ?? 20,
    );

    return Marker(
      markerId: MarkerId(location.entity.name),
      position: LatLng(location.lat, location.lng),
      icon: icon,
      onTap: () {
        onTap(location);
      },
    );
  }

  LatLngBounds getBounds(List<Location> locations) {
    final minLat = locations.map((location) => location.lat).reduce(math.min);
    final minLng = locations.map((location) => location.lng).reduce(math.min);

    final maxLat = locations.map((location) => location.lat).reduce(math.max);
    final maxLng = locations.map((location) => location.lng).reduce(math.max);

    return LatLngBounds(
      southwest: LatLng(minLat, minLng),
      northeast: LatLng(maxLat, maxLng),
    );
  }

  Set<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps,
      List<Location> locations, void Function(Location) onTap) {
    Set<Marker> markers = {};
    bitmaps.asMap().forEach((i, bmp) {
      Location location = locations[i];
      markers.add(Marker(
        onTap: () {
          onTap(location);
        },
        markerId: MarkerId(location.entity.name),
        position: LatLng(location.lat, location.lng),
        icon: BitmapDescriptor.fromBytes(bmp),
      ));
    });

    return markers;
  }
}
