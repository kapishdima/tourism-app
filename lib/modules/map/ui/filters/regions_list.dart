import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/map/store/filters_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/checkbox.dart';

class RegionsList extends StatefulWidget {
  const RegionsList({Key? key}) : super(key: key);

  @override
  State<RegionsList> createState() => _RegionsListState();
}

class _RegionsListState extends State<RegionsList> {
  final FiltersStore filtersStore = appStoresContainer.get<FiltersStore>();

  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  @override
  void initState() {
    super.initState();

    countriesStore.getRegions();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalization.of(context).t("regions_title"),
            style: AppTextsStyles.cardTitle.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 16),
          Observer(builder: (context) {
            if (countriesStore.regions.isEmpty) {
              return Container();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: countriesStore.regions
                  .map(
                    (region) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CheckboxWidget(
                        isChecked: filtersStore.selectedRegions
                            .contains(region.id.toString()),
                        value: region.id.toString(),
                        label: region.name,
                        onChange: (value) {
                          filtersStore.changeRegions(region.id.toString());
                        },
                      ),
                    ),
                  )
                  .toList(),
            );
          })
        ],
      ),
    );
  }
}
