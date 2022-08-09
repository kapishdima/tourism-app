import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/modules/map/services/map_service.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/active_marker.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/finish_marker.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/marker_generator.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/not_included_marker.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/ordered_marker.dart';
import 'package:sea_of_wine_app/modules/map/ui/markers/start_marker.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';

import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/lib/create_bitmap.dart';

class MarkersProvider extends StatelessWidget {
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();

  final void Function(Set<Marker> markers) onGenerated;
  final void Function(Set<Marker> markers) onGeneratedActiveMarker;

  MarkersProvider(
      {super.key,
      required this.onGenerated,
      required this.onGeneratedActiveMarker});

  void generateActiveMarker(BuildContext context, Location location) {
    MarkerGenerator([ActiveMarker()], (bitmaps) {
      if (bitmaps.isEmpty) {
        return;
      }

      Uint8List bytes = bitmaps.first;
      BitmapDescriptor icon = createBitmapFromBytes(bytes);
      Marker marker = MapService.createMarkerWithIcon(
        isActive: true,
        location: location,
        icon: icon,
        onTap: () => locationsStore.setCurrentLocation(location),
      );

      onGeneratedActiveMarker({marker});
    }).generate(context);
  }

  void generateMarker(
      BuildContext context, List<Widget> widgets, List<Location> locations) {
    MarkerGenerator(widgets, (bitmaps) {
      Set<Marker> generatedMarkers = {};
      locations.asMap().forEach((index, location) {
        Uint8List bytes = bitmaps[index];
        BitmapDescriptor icon = createBitmapFromBytes(bytes);
        Marker marker = MapService.createMarkerWithIcon(
            location: location,
            icon: icon,
            onTap: () => locationsStore.setCurrentLocation(location));

        generatedMarkers.add(marker);
      });

      if (generatedMarkers.isNotEmpty) {
        onGenerated(generatedMarkers);
      }
    }).generate(context);
  }

  List<Widget> buildNotIncludedMarkers(BuildContext context,
      {required List<Location> locations}) {
    return locations
        .map((location) => NotIncludedMarker(icon: location.icon))
        .toList();
  }

  List<Widget> buildIncludedMarkers(BuildContext context,
      {required List<Location> waypoints}) {
    final Widget startWidget = StartMarker();
    final Widget finishWidget = FinishMarker();
    final List<Widget> waypointsWidgets = waypoints
        .map((location) => OrderedMarker(
              location: location,
            ))
        .toList();

    return [startWidget, finishWidget, ...waypointsWidgets];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      // if (locationsStore.isLoading) {
      //   return const Center(
      //     child: CircularProgressIndicator(
      //       color: AppColors.bordo,
      //       strokeWidth: 1,
      //     ),
      //   );
      // }

      print("Observer");

      List<Widget> includedMarkers =
          buildIncludedMarkers(context, waypoints: locationsStore.waypoints);
      List<Widget> notIncludedMarkers = buildNotIncludedMarkers(context,
          locations: locationsStore.notIncludedLocations);

      generateMarker(context, [
        ...includedMarkers,
        ...notIncludedMarkers
      ], [
        ...locationsStore.includedLocations,
        ...locationsStore.notIncludedLocations
      ]);

      if (locationsStore.selectedLocation != null) {
        generateActiveMarker(context, locationsStore.selectedLocation!);
      }

      return Container();
    });
  }
}
