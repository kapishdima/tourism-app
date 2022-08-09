import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/modules/ways/ui/ways_list_horizontal.dart';
import 'package:sea_of_wine_app/modules/ways/ui/ways_list_vertical.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/lists/draggable_list.dart';

enum WaysListTypes {
  vertical,
  horizontal,
}

class WaysList extends StatefulWidget {
  final WaysListTypes type;
  const WaysList({Key? key, required this.type}) : super(key: key);

  @override
  State<WaysList> createState() => _WaysListState();
}

class _WaysListState extends State<WaysList> {
  WaysStore waysStore = appStoresContainer.get<WaysStore>();
  LocalesStore localesStore = appStoresContainer.get<LocalesStore>();
  CountriesStore countriesStore = appStoresContainer.get<CountriesStore>();

  @override
  void initState() {
    super.initState();

    waysStore.getWays(
        locale: localesStore.currentLocale,
        country: countriesStore.currentCountry);

    reaction<String>((_) => localesStore.currentLocale, (locale) {
      waysStore.getWays(locale: locale, country: countriesStore.currentCountry);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.type == WaysListTypes.vertical) {
      return DraggableList(
        builder: (close) => WaysListVertical(closeOnTap: close),
      );
    }

    if (widget.type == WaysListTypes.horizontal) {
      return WaysListHorizontal();
    }

    return Container();
  }
}
