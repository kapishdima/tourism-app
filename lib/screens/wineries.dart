import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';

import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/map.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';

import 'package:sea_of_wine_app/modules/wineries/models/winery.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/modules/wineries/ui/wineries_list.dart';
import 'package:sea_of_wine_app/modules/wineries/ui/wineries_sort_row.dart';

import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/lists/draggable_list.dart';

import 'package:sea_of_wine_app/setup.dart';

class WineriesScreen extends StatefulWidget {
  const WineriesScreen({Key? key}) : super(key: key);

  @override
  State<WineriesScreen> createState() => _WineriesScreenState();
}

class _WineriesScreenState extends State<WineriesScreen> {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  @override
  void initState() {
    super.initState();

    reaction<String>(
      (_) => localesStore.currentLocale,
      (locale) => wineriesStore.getWineries(
          locale: locale, country: countriesStore.currentCountry),
    );

    wineriesStore.getWineries(
        locale: localesStore.currentLocale,
        country: countriesStore.currentCountry);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return WineriesScreenView(
          country: countriesStore.currentName,
          wineries: wineriesStore.wineries,
        );
      },
    );
  }
}

class WineriesScreenView extends StatelessWidget {
  final List<Winery> wineries;
  final String country;

  final WaysStore waysStore = appStoresContainer.get<WaysStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  WineriesScreenView({Key? key, required this.wineries, required this.country})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      title:
          "${AppLocalization.of(context).t('wineries_screen_title')} $country",
      children: Stack(
        children: [
          const MapWidget(
            hasDraggableList: true,
          ),
          DraggableList(
            builder: (close) => Column(
              children: [
                const SizedBox(
                  height: 38,
                  child: WinerySortRow(),
                ),
                Expanded(
                  child: WineriesList(
                    onCardTap: close,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
