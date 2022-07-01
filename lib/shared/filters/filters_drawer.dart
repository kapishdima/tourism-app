import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:quiver/iterables.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';
import 'package:sea_of_wine_app/shared/filters/filter_checkbox.dart';
import 'package:sea_of_wine_app/store/filters_store.dart';

class FiltersDrawer extends StatelessWidget {
  final void Function(List<String> filter) onApplyFilter;
  final List<Map<String, String>> filters = [
    {"Wineries": "winery"},
    {"Tourist attractions": "attraction"},
    {"Resturants": "restaurant"},
    {"Hotels": "hotel"},
    {"Wine bars/cafes": "wine_bar"}
  ];

  FiltersDrawer({
    Key? key,
    required this.onApplyFilter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final FiltersStore filtersStore = Provider.of<FiltersStore>(context);

    void onFilterChange(String filter) {
      filtersStore.changeFilter(filter);
      onApplyFilter(filtersStore.selectedFilters);
    }

    return SizedBox(
      width: size.width,
      child: Drawer(
          backgroundColor: AppColors.white,
          elevation: 0,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              SizedBox(
                height: 60,
                child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Filters",
                            style: AppTheme.ligthTheme.textTheme.headline2!
                                .copyWith(color: AppColors.dark)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon:
                                SvgPicture.asset("assets/icons/close_icon.svg"))
                      ],
                    )),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              Observer(builder: (_) {
                return Wrap(
                  children: partition(filters, 2).map((filterGroup) {
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: filterGroup.map((filter) {
                            String label = filter.keys.first;
                            String value = filter.values.first;
                            return SizedBox(
                              width: 150,
                              child: FilterCheckbox(
                                label: label,
                                value: value,
                                isChecked: filtersStore.selectedFilters
                                    .contains(value),
                                onChange: onFilterChange,
                              ),
                            );
                          }).toList(),
                        ));
                  }).toList(),
                );
              })
            ],
          )),
    );
  }
}
