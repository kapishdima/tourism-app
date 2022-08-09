import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/shared/lib/get_list_chunks.dart';

class PolylinesService {
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};
  PolylinePoints polylinePoints = PolylinePoints();

  Future<Map<PolylineId, Polyline>> createPolylines(
      {required List<Location> locations}) async {
    var locationsChunks = chunk<Location>(locations, 9);

    for (var chunk in locationsChunks) {
      Location origin = chunk.first;
      Location destination = chunk.last;
      List<Location> waypoints = chunk.length > 1
          ? chunk.getRange(1, chunk.length - 1).toList()
          : chunk;

      PolylineResult directionsResult = await _getPossibleDirections(
          origin: LatLng(origin.lat, origin.lng),
          destination: LatLng(destination.lat, destination.lng),
          waypoints: waypoints
              .map((waypoint) => "${waypoint.lat},${waypoint.lng}")
              .toList());

      if (directionsResult.points.isEmpty) {
        throw Exception("Direction not found");
      }

      for (var point in directionsResult.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }

      PolylineId id = PolylineId('${origin.lat}.${origin.lng}.');
      polylines[id] = createStyledPolyline(id);
    }

    return polylines;
  }

  Polyline createStyledPolyline(PolylineId id) {
    return Polyline(
      polylineId: id,
      color: AppColors.dark,
      points: polylineCoordinates,
      width: 2,
    );
  }

  Future<PolylineResult> _getPossibleDirections({
    required LatLng origin,
    required LatLng destination,
    required List<String> waypoints,
  }) async {
    return await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAsog6n2FPsc0Q3hXUzXYAGLMPIaR7_r9A",
      PointLatLng(origin.latitude, origin.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
      wayPoints: waypoints
          .map((waypoint) => PolylineWayPoint(location: waypoint))
          .toList(),
    );
  }
}
