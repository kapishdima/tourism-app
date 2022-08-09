import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/map.dart';

import 'package:sea_of_wine_app/modules/ways/ui/way_list.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';

class RoutesScreen extends StatelessWidget {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  RoutesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      title:
          "${AppLocalization.of(context).t('routes_screen_title')} ${countriesStore.currentName}",
      children: Stack(
        children: const [
          MapWidget(hasDraggableList: true),
          WaysList(type: WaysListTypes.vertical)
        ],
      ),
    );
  }
}
