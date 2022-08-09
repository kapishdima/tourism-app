import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final Set<Marker> markers;
  final Set<Polyline> polyline;
  final void Function(GoogleMapController controller) onInitialized;

  final Set<Factory<OneSequenceGestureRecognizer>> gestureRecognizers = {
    Factory<OneSequenceGestureRecognizer>(
      () => EagerGestureRecognizer(),
    )
  };

  final CameraPosition initialCameraPosition =
      const CameraPosition(target: LatLng(45.994018, 31.233045), zoom: 18);

  MapView(
      {super.key,
      required this.markers,
      required this.polyline,
      required this.onInitialized});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          gestureRecognizers: gestureRecognizers,
          minMaxZoomPreference: const MinMaxZoomPreference(0, 20),
          initialCameraPosition: initialCameraPosition,
          polylines: polyline,
          markers: markers,
          compassEnabled: false,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          buildingsEnabled: false,
          onMapCreated: (GoogleMapController controller) {
            rootBundle.loadString('assets/map_styles.json').then((style) {
              controller.setMapStyle(style);
            });
            onInitialized(controller);
          },
        ),
      ],
    );
  }
}
