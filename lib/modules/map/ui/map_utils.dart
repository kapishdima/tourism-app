import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:collection/collection.dart';
import 'package:sea_of_wine_app/modules/map/services/map_service.dart';

class MapRenderUtils {
  static Marker? getActiveMarker(Set<Marker> source) {
    return source.firstWhereOrNull(
      (marker) =>
          marker.markerId.value.startsWith(MapService.activeLocationKey),
    );
  }

  static Marker? getUniqueMarker(Set<Marker> source, Set<Marker> from) {
    List<String> markersIds =
        source.map((marker) => marker.mapsId.value).toList();
    return from.firstWhereOrNull(
        (marker) => !markersIds.contains(marker.mapsId.value));
  }

  static bool shouldRerenderMarkers(Set<Marker> prev, Set<Marker> current) {
    Marker? uniqueMarker = getUniqueMarker(prev, current);
    return uniqueMarker != null;
  }

  static bool shouldRerenderPolyline(
      Set<Polyline> prev, Set<Polyline> current) {
    List<String> polylineIds =
        prev.map((polyline) => polyline.polylineId.value).toList();
    Polyline? uniquePolyline = current.firstWhereOrNull(
        (polyline) => !polylineIds.contains(polyline.polylineId.value));
    return uniquePolyline != null;
  }
}
