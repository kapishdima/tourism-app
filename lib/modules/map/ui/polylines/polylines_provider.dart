import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:sea_of_wine_app/modules/map/services/polylines_service.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/setup.dart';

class PolylinesProvider extends StatelessWidget {
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  final void Function(Set<Polyline> polylines) onGenerated;

  PolylinesProvider({Key? key, required this.onGenerated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      // if (locationsStore.isLoading) {
      //   return const Center(
      //     child: CircularProgressIndicator(
      //       color: AppColors.bordo,
      //       strokeWidth: 2,
      //     ),
      //   );
      // }

      PolylinesService()
          .createPolylines(locations: locationsStore.includedLocations)
          .then((polylines) {
        if (polylines.isNotEmpty) {
          onGenerated(Set.of(polylines.values));
        }
      });

      return Container();
    });
  }
}
