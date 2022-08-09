import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/filters_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/checkbox.dart';

class TagsList extends StatefulWidget {
  const TagsList({Key? key}) : super(key: key);

  @override
  State<TagsList> createState() => _TagsListState();
}

class _TagsListState extends State<TagsList> {
  final FiltersStore filtersStore = appStoresContainer.get<FiltersStore>();
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();

  @override
  void initState() {
    super.initState();

    filtersStore.getTags(
        country: countriesStore.currentCountry,
        locale: localesStore.currentLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            AppLocalization.of(context).t("tags_title"),
            style: AppTextsStyles.cardTitle.copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 16),
          Observer(builder: (context) {
            if (filtersStore.isTagsLoading) {
              return const CircularProgressIndicator(
                color: AppColors.bordo,
                strokeWidth: 1,
              );
            }
    
            if (filtersStore.tags.isEmpty) {
              return Container();
            }
    
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: filtersStore.tags
                  .map(
                    (tag) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: CheckboxWidget(
                        isChecked: filtersStore.selectedTags.contains(tag.name),
                        value: tag.name,
                        label: tag.name,
                        onChange: (value) {
                          filtersStore.changeTag(tag.name);
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
