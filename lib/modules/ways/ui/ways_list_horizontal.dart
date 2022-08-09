import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';

import 'package:sea_of_wine_app/modules/ways/model/way.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/modules/ways/ui/way_card_horizontal.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/setup.dart';

class WaysListHorizontal extends StatelessWidget {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  WaysListHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (waysStore.isLoading) {
        return SizedBox(
          height: 240,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return WayCard.loading();
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 10,
            ),
          ),
        );
      }
      return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 230),
        child: ListView.separated(
            padding: const EdgeInsets.only(right: AppSizes.defaulPadding),
            scrollDirection: Axis.horizontal,
            itemCount: waysStore.ways.length,
            itemBuilder: (context, index) {
              Way way = waysStore.ways[index];
              return Observer(builder: (context) {
                return WayCard.loaded(
                  configuration: WayCardConfiguration(
                      id: way.id,
                      image: way.thumbnail.url,
                      name: way.name,
                      description: way.text,
                      onCardTap: () {
                        waysStore.setCurrentWayId(way.id);
                        locationsStore.setCurrentLocation(null);
                      },
                      onLinkTap: () {
                        waysStore.setCurrentWayId(way.id);
                        Navigator.pushNamed(context, "/route");
                      },
                      isSelected: waysStore.currentWayId == way.id),
                );
              });
            },
            separatorBuilder: (context, index) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Center(
                    child: Container(
                      width: 1,
                      color: AppColors.gray,
                    ),
                  ),
                )),
      );
    });
  }
}
