import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/modules/map/services/map_service.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/map_utils.dart';
import 'package:sea_of_wine_app/modules/map/ui/map_view.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/marker_provider.dart';
import 'package:sea_of_wine_app/modules/map/ui/polylines/polylines_provider.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/setup.dart';

class MapProvider extends StatefulWidget {
  final bool isBlackSeaMap;
  final Location? activeLocation;

  const MapProvider({Key? key, this.isBlackSeaMap = false, this.activeLocation})
      : super(key: key);

  @override
  State<MapProvider> createState() => _MapProviderState();
}

class _MapProviderState extends State<MapProvider> {
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  Set<Marker> markers = {};
  Set<Polyline> polyline = {};
  GoogleMapController? mapController;

  void onInitialized(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    super.initState();

    locationsStore.clearCurrentLocation();
    locationsStore.clearSelectedLocation();

    if (widget.isBlackSeaMap) {
      locationsStore.getBlackSeaLocations();
    } else {
      reaction<int>(
        (_) => waysStore.currentWayId,
        (id) => locationsStore.getLocations(waysStore.currentWayId),
      );
    }

    reaction<Location?>(
      (_) => locationsStore.currentLocation,
      (location) async {
        if (location != null && locationsStore.selectedLocation == null) {
          mapController?.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(location.lat, location.lng),
            ),
          );
        }
      },
    );

    reaction<Location?>(
      (_) => locationsStore.selectedLocation,
      (location) async {
        print(location);
        if (location != null) {
          mapController?.moveCamera(
            CameraUpdate.newLatLng(
              LatLng(location.lat, location.lng),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    mapController?.dispose();

    locationsStore.clearCurrentLocation();
    locationsStore.clearSelectedLocation();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MarkersProvider(
          onGenerated: onGeneratedMarkers,
          onGeneratedActiveMarker: onGeneratedActiveMarker,
        ),
        PolylinesProvider(onGenerated: onGeneratedPolyline),
        MapView(
          markers: markers,
          polyline: polyline,
          onInitialized: onInitialized,
        )
      ],
    );
  }

  void moveCamera() async {
    if (markers.isEmpty) {
      return;
    }

    mapController?.animateCamera(
      MapService.getDirectionBounds(markers),
    );
  }

  void onGeneratedActiveMarker(Set<Marker> generatedMarkers) async {
    if (markers.isEmpty ||
        MapRenderUtils.shouldRerenderMarkers(markers, generatedMarkers)) {
      Marker? activeMarker = MapRenderUtils.getActiveMarker(markers);
      setState(() {
        if (activeMarker != null) {
          markers.remove(activeMarker);
        }
        markers.add(generatedMarkers.first);
      });
    }
  }

  void onGeneratedMarkers(Set<Marker> generatedMarkers) async {
    if (markers.isEmpty ||
        MapRenderUtils.shouldRerenderMarkers(markers, generatedMarkers)) {
      setState(() {
        markers = generatedMarkers;
      });
    }
  }

  void onGeneratedPolyline(Set<Polyline> generatedPolyline) {
    if (polyline.isEmpty ||
        MapRenderUtils.shouldRerenderPolyline(polyline, generatedPolyline)) {
      setState(() {
        polyline = generatedPolyline;
      });
    }

    moveCamera();
  }
}
