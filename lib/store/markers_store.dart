import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/services/map_service.dart';

part 'markers_store.g.dart';

class MarkersStore = _MarkersStore with _$MarkersStore;

abstract class _MarkersStore with Store {
  @observable
  Set<Marker> markers = {};

  @action
  setMarkers(Set<Marker> _markers) {
    markers = {...markers, ..._markers};
  }

  Future<void> setNotIncludedMarkers(List<Location> locations,
      Map<String, double>? dimensions, void Function(Location location) onTap) async {
    Set<Marker> notIncludedMarkers = await MapService().createMarkerWithIcon(
        locations: locations,
        dimensions: dimensions,
        onTap: (location) {
          onTap(location);
        });

    setMarkers(notIncludedMarkers);
  }

  Future<void> setStartMarker(List<Location> locations,
      Map<String, double> dimensions, void Function(Location location) onTap) async {
    Marker startMarker = await MapService().createStartMarker(
        location: locations.first,
        dimensions: dimensions,
        onTap: (location) {
          onTap(location);
        });
    setMarkers({startMarker});
  }

  Future<void> setFinishMarker(List<Location> locations,
      Map<String, double> dimensions, void Function(Location location) onTap) async {
    Marker finishMarker = await MapService().createFinishMarker(
        location: locations.last,
        dimensions: dimensions,
        onTap: (location) {
          onTap(location);
        });

    setMarkers({finishMarker});
  }

  void setOrderedMarkers(List<Location> locations, List<Uint8List> bitmaps, void Function(Location) onTap) {
    setMarkers(MapService().mapBitmapsToMarkers(bitmaps, locations, onTap));
  }
}
