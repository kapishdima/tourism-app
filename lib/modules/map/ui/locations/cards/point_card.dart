import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_types.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/cards/attraction_card.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/cards/horeca_card.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/cards/winery_card.dart';
import 'package:sea_of_wine_app/setup.dart';

class PointCard extends StatelessWidget {
  final bool hasDraggableList;
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  PointCard({Key? key, required this.hasDraggableList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (locationsStore.currentLocation == null) {
        return Container();
      }

      switch (locationsStore.currentLocation!.entityType) {
        case LocationTypes.attraction:
          {
            if (hasDraggableList) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: AttractionCard(
                  location: locationsStore.currentLocation!,
                  onClose: locationsStore.clearCurrentLocation,
                ),
              );
            }

            return AttractionCard(
              location: locationsStore.currentLocation!,
              onClose: locationsStore.clearCurrentLocation,
            );
          }
        case LocationTypes.horeca:
          {
            if (hasDraggableList) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: HorecaCard(
                  location: locationsStore.currentLocation!,
                  onClose: locationsStore.clearCurrentLocation,
                ),
              );
            }

            return HorecaCard(
              location: locationsStore.currentLocation!,
              onClose: locationsStore.clearCurrentLocation,
            );
          }
        case LocationTypes.winery:
          {
            if (hasDraggableList) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: WineryCard(
                  location: locationsStore.currentLocation!,
                  onClose: locationsStore.clearCurrentLocation,
                ),
              );
            }
            return WineryCard(
              location: locationsStore.currentLocation!,
              onClose: locationsStore.clearCurrentLocation,
            );
          }
        default:
          {
            return Container();
          }
      }
    });
  }
}
