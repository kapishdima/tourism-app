import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';

import 'package:sea_of_wine_app/modules/wineries/models/winery.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/modules/wineries/ui/winery_card_vertical.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/setup.dart';

class WineriesList extends StatelessWidget {
  final VoidCallback onCardTap;
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  WineriesList({
    Key? key,
    required this.onCardTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (wineriesStore.isLoading) {
        return ListView.separated(
            itemBuilder: (context, index) {
              return WineryCard.loading();
            },
            separatorBuilder: (_, index) {
              return const SizedBox(
                height: AppSizes.defaulPadding * 2,
              );
            },
            itemCount: 3);
      }
      return ListView.separated(
        padding: const EdgeInsets.only(bottom: AppSizes.defaulPadding * 2),
        itemBuilder: (context, index) {
          final Winery winery = wineriesStore.wineries[index];
          return Observer(builder: (context) {
            return WineryCard.loaded(
              WineryCardLoadedConfiguration(
                  id: winery.id,
                  image: winery.thumbnail.url,
                  name: winery.name,
                  rating: winery.rating,
                  reviewsCount: winery.reviewsCount,
                  isSelected: wineriesStore.currentWineryId == winery.id,
                  onCardTap: () {
                    wineriesStore.setCurrentWineryId(winery.id);
                    locationsStore.setSelectedLocation(winery.location);
                    locationsStore
                        .setCurrentLocation(Winery.toLocation(winery));
                    onCardTap();
                  },
                  onLinkTap: () {
                    wineriesStore.setCurrentWineryId(winery.id);
                    Navigator.pushNamed(context, '/winery');
                  }),
            );
          });
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: AppSizes.defaulPadding * 2,
          );
        },
        itemCount: wineriesStore.wineries.length,
      );
    });
  }
}
