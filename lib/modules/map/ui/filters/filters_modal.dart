import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';

import 'package:sea_of_wine_app/modules/map/store/filters_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/filters/filtres_list.dart';
import 'package:sea_of_wine_app/modules/map/ui/filters/regions_list.dart';
import 'package:sea_of_wine_app/modules/tags/ui/tags_list.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';

class Dimensions {
  final double width;
  final double height;

  Dimensions({required this.width, required this.height});
}

class FiltersModal extends StatefulWidget {
  const FiltersModal({
    Key? key,
  }) : super(key: key);

  @override
  State<FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<FiltersModal> {
  final FiltersStore filtersStore = appStoresContainer.get<FiltersStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();

  @override
  Widget build(BuildContext context) {
    return Layout(
      children: GridContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            const SizedBox(height: AppSizes.defaulPadding),
            const SizedBox(width: double.infinity, child: FiltresList()),
            const SizedBox(height: AppSizes.defaulPadding),
            Text(
          AppLocalization.of(context).t("hashtags_title"),
          style:
              AppTextsStyles.headline2Condensed.copyWith(color: AppColors.dark),
        ),
        const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                RegionsList(),
                SizedBox(width: 40),
                TagsList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          AppLocalization.of(context).t("filtres_title"),
          style:
              AppTextsStyles.headline2Condensed.copyWith(color: AppColors.dark),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
            locationsStore.filterLocations(
              wayId: waysStore.currentWayId,
              filters: filtersStore.selectedFilters,
              tags: filtersStore.selectedTags,
              regions: filtersStore.selectedRegions,
            );
          },
          child: SvgPicture.asset("assets/icons/close_icon.svg"),
        )
      ],
    );
  }
}
