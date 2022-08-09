import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_types.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/location_card.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/setup.dart';

class CountriesLocationsList extends StatelessWidget {
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();

  CountriesLocationsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (locationsStore.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      return Container(
        padding: const EdgeInsets.only(left: 30),
        constraints: const BoxConstraints(
          minHeight: 240,
          maxHeight: 320,
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(right: AppSizes.defaulPadding),
            itemBuilder: (context, groupIndex) {
              List<Location> locations =
                  locationsStore.blackSeaLocations.values.toList()[groupIndex];
              return Row(
                children: locations
                    .asMap()
                    .map((index, location) {
                      int lastGroupIndex =
                          locationsStore.blackSeaLocations.values.length - 1;
                      int lastLocatioIndex = locations.length - 1;
                      bool isFinish = groupIndex == lastGroupIndex &&
                          index == lastLocatioIndex;
                      return MapEntry(
                          index,
                          LocationCard(
                            configuration: LocationCardConfiguration(
                                id: location.id,
                                name: location.entity.name,
                                image: location.entity.image.path,
                                rating: 4,
                                reviewsCount: 50,
                                type: location.entityType,
                                order: location.order,
                                isStart: index == 0,
                                isFinish: isFinish,
                                shouldRenderCountryName: index == 0,
                                countryName: location.countryName,
                                onLinkTap: location.entityType ==
                                        LocationTypes.winery
                                    ? () {
                                        Navigator.pushNamed(context, "/winery");
                                        wineriesStore
                                            .setCurrentWineryId(location.id);
                                      }
                                    : null,
                                onCardTap: () =>
                                    locationsStore.setCurrentLocation(location),
                                isSelected:
                                    locationsStore.currentLocation?.id ==
                                        location.id),
                          ));
                    })
                    .values
                    .toList(),
              );
            },
            itemCount: locationsStore.blackSeaLocations.values.length),
      );
    });
  }
}
