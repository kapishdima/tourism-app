import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/map/store/filters_store.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/checkbox.dart';

class FiltresList extends StatefulWidget {
  const FiltresList({Key? key}) : super(key: key);

  @override
  State<FiltresList> createState() => _FiltresListState();
}

class _FiltresListState extends State<FiltresList> {
  final FiltersStore filtersStore = appStoresContainer.get<FiltersStore>();

  final List<Map<String, String>> filters = [
    {"filters_winery": "winery"},
    {"filters_attraction": "attraction"},
    {"filters_restaurants": "restaurant"},
    {"filters_hotels": "hotel"},
    {"filters_wine_bars": "wine_bar"}
  ];

  void onFilterChange(String filter) {
    filtersStore.changeFilter(filter);
  }

  @override
  void initState() {
    super.initState();

    if (filtersStore.selectedFilters.isEmpty) {
      filtersStore.setFilters(
        filters.map((filter) => filter.values).expand((i) => i).toList(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Wrap(
        alignment: WrapAlignment.spaceBetween,
        runSpacing: 15,
        children: filters.map((filter) {
          String label = filter.keys.first;
          String value = filter.values.first;
          return ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 90, maxWidth: 150),
            child: CheckboxWidget(
              label: AppLocalization.of(context).t(label),
              value: value,
              isChecked: filtersStore.selectedFilters.contains(value),
              onChange: onFilterChange,
            ),
          );
        }).toList(),
      );
    });
  }
}
