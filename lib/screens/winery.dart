import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/modules/wineries/ui/winery_screen_view.dart';

import 'package:sea_of_wine_app/setup.dart';

class WineryScreen extends StatefulWidget {
  const WineryScreen({Key? key}) : super(key: key);

  @override
  State<WineryScreen> createState() => _WineryScreenState();
}

class _WineryScreenState extends State<WineryScreen> {
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  @override
  void initState() {
    super.initState();

    reaction<String>(
        (_) => localesStore.currentLocale,
        (locale) => wineriesStore.getWineryById(
              country: countriesStore.currentCountry,
              id: wineriesStore.currentWineryId,
              locale: locale,
            ));

    reaction<Winery?>((_) => wineriesStore.winery, (winery) {
      if (winery != null) {
        locationsStore.setSelectedLocation(winery.location);
      }
    });

    wineriesStore.getWineryById(
      country: countriesStore.currentCountry,
      id: wineriesStore.currentWineryId,
      locale: localesStore.currentLocale,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (wineriesStore.isLoading) {
        return WineryScreenView.loading();
      }
      return WineryScreenView.loaded(
        WineryScreenConfiguration(
          image: wineriesStore.winery!.image.url,
          gallery:
              wineriesStore.winery!.gallery.map((image) => image.url).toList(),
          text: wineriesStore.winery!.description,
          name: wineriesStore.winery!.name,
          rating: wineriesStore.winery!.rating,
          reviewsCount: wineriesStore.winery!.reviewsCount,
          reviews: wineriesStore.winery!.reviews,
          additionalInfo: wineriesStore.winery!.additionalInfo,
          location: wineriesStore.winery!.location,
        ),
      );
    });
  }
}
