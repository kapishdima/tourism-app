import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:quiver/iterables.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/services/map_service.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/cards/winery_card.dart';
import 'package:sea_of_wine_app/shared/filters/filter_button.dart';
import 'package:sea_of_wine_app/shared/filters/filters_drawer.dart';
import 'package:sea_of_wine_app/shared/lib/get_size.dart';
import 'package:sea_of_wine_app/shared/map/location_image.dart';
import 'package:sea_of_wine_app/shared/map/marker.dart';
import 'package:sea_of_wine_app/store/locations_store.dart';
import 'package:sea_of_wine_app/store/markers_store.dart';

class MapWidget extends StatefulWidget {
  final int wayId;
  const MapWidget({Key? key, required this.wayId}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final LocationsStore locationsStore = LocationsStore();
  final MarkersStore markersStore = MarkersStore();

  double _cardOpacity = 0;
  Map<PolylineId, Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();

    locationsStore.getIncludedLocations(widget.wayId);
    locationsStore.getNotIncludedLocations(widget.wayId);
  }

  void onFiltersApply(List<String> filters) {
    locationsStore.filterLocations(widget.wayId, filters);
  }

  void onMarkerTap(Location location) {
    locationsStore.setCurrentLocation(location);
    setState(() {
      _cardOpacity = 1;
    });
  }

  Future<void> setDirection(
      List<Location> locations, GoogleMapController controller) async {
    if (locations.isEmpty) {
      return;
    }

    var chunks = partition<Location>(locations, 9);

    for (var chunk in chunks) {
      Location origin = chunk.first;
      Location destination = chunk.last;
      List<Location> waypoints = chunk.length > 1
          ? chunk.getRange(1, chunk.length - 1).toList()
          : chunk;

      var polylines = await MapService().createPolylines(
          origin: LatLng(origin.lat, origin.lng),
          destination: LatLng(destination.lat, destination.lng),
          waypoints: waypoints
              .map((location) => "${location.lat},${location.lng}")
              .toList());

      setState(() {
        _polylines = polylines;
      });

      controller.animateCamera(
          CameraUpdate.newLatLngBounds(MapService().getBounds(locations), 150));
    }
  }

  void setIncludedMarkers(List<Location> locations, BuildContext context) {
    if (locations.isEmpty) {
      return;
    }

    List<Location> waypoints =
        locations.getRange(1, locations.length - 1).toList();
    MarkerGenerator(markersWidgets(waypoints), (bitmaps) {
      markersStore.setOrderedMarkers(waypoints, bitmaps, onMarkerTap);
    }).generate(context);
  }

  List<Widget> markersWidgets(List<Location> locations) {
    return locations
        .map((location) => LocationMarker(
              location: location,
            ))
        .toList();
  }

  Future<void> setMapStyle(GoogleMapController controller) async {
    String style = await rootBundle.loadString("assets/map_styles.json");
    controller.setMapStyle(style);
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> markerSize = getSize(context);

    return Scaffold(
        body: Stack(children: [
          Observer(builder: ((context) {
            final includedLocations = locationsStore.inlucdedLocationFuture;
            final notIncludedLocations =
                locationsStore.notInlucdedLocationFuture;

            if (includedLocations?.status == FutureStatus.pending ||
                notIncludedLocations?.status == FutureStatus.pending) {
              return const Center(
                  child: CircularProgressIndicator(color: AppColors.bordo));
            }

            return GoogleMap(
              gestureRecognizers: {
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              },
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(_polylines.values),
              initialCameraPosition: const CameraPosition(
                target: LatLng(46.503615, 30.754493),
                zoom: -14,
              ),
              onMapCreated: (GoogleMapController controller) {
                setMapStyle(controller);
                setDirection(includedLocations?.result, controller);

                markersStore.setNotIncludedMarkers(
                    notIncludedLocations?.result, markerSize, onMarkerTap);
                markersStore.setStartMarker(
                    includedLocations?.result, markerSize, onMarkerTap);
                markersStore.setFinishMarker(
                    includedLocations?.result, markerSize, onMarkerTap);
                setIncludedMarkers(includedLocations?.result, context);
              },
              markers: markersStore.markers,
            );
          })),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedOpacity(
                duration: const Duration(microseconds: 500),
                opacity: _cardOpacity,
                curve: Curves.easeInOut,
                child: Observer(
                  builder: (_) =>
                      WineryCard(location: locationsStore.currentLocation),
                )),
          )
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: const FiltersButton(),
        drawer: FiltersDrawer(
          onApplyFilter: onFiltersApply,
        ));
  }
}
