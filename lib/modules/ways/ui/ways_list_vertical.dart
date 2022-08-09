import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';

import 'package:sea_of_wine_app/modules/ways/model/way.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/modules/ways/ui/way_card_vertical.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/setup.dart';

class WaysListVertical extends StatelessWidget {
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  final VoidCallback closeOnTap;

  WaysListVertical({
    Key? key,
    required this.closeOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (waysStore.isLoading) {
        return ListView.separated(
            itemBuilder: (context, index) => WayCardVertical.loading(),
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: AppSizes.defaulPadding * 2,
              );
            },
            itemCount: 10);
      }

      return ListView.separated(
          padding: const EdgeInsets.only(bottom: 60),
          itemBuilder: (context, index) {
            final Way way = waysStore.ways[index];

            return Observer(builder: (context) {
              return WayCardVertical.loaded(
                  configuration: WayCardVerticalConfiguration(
                      name: way.name,
                      thumbnail: way.thumbnail.url,
                      description: way.text,
                      onCardTap: () {
                        waysStore.setCurrentWayId(way.id);
                        locationsStore.setCurrentLocation(null);
                        closeOnTap();
                      },
                      onLinkTap: () {
                        waysStore.setCurrentWayId(way.id);
                        Navigator.pushNamed(context, "/route");
                      },
                      isSelected: waysStore.isSelected(way.id)));
            });
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: AppSizes.defaulPadding * 2,
            );
          },
          itemCount: waysStore.ways.length);
    });
  }
}
