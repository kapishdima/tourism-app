import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/map/services/map_service.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/screens/wineries.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

class SortType {
  final String lable;
  final String value;

  SortType({required this.lable, required this.value});
}

class WinerySortRow extends StatefulWidget {
  const WinerySortRow({Key? key}) : super(key: key);

  @override
  State<WinerySortRow> createState() => _WinerySortRowState();
}

class _WinerySortRowState extends State<WinerySortRow> {
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();
  static final List<SortType> sortTypes = [
    SortType(lable: "sort_by_rating", value: "rating"),
    SortType(lable: "sort_by_alphabet", value: "alphabet"),
    SortType(lable: "sort_by_gps", value: "gps"),
  ];

  SortType activeSortType = sortTypes.first;

  void onSortTypeTap(SortType sortType) async {
    setState(() {
      activeSortType = sortType;
    });

    if (sortType.value == "gps") {
      Position currentPosition = await MapService.determinePosition();
      wineriesStore.sortedByGPS(currentPosition);
    }

    wineriesStore.sort(sortType.value);
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      activeSortType = sortTypes.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle activeSortTypeStyle =
        AppTextsStyles.paragraphMedium.copyWith(color: AppColors.bordo);
    TextStyle defaultSortTypeStyle =
        AppTextsStyles.paragraph.copyWith(color: AppColors.dark);

    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: sortTypes
            .map((sortType) => GestureDetector(
                  onTap: () => onSortTypeTap(sortType),
                  child: Text(AppLocalization.of(context).t(sortType.lable),
                      style: activeSortType == sortType
                          ? activeSortTypeStyle
                          : defaultSortTypeStyle),
                ))
            .toList());
  }
}
