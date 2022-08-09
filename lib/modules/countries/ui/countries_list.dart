import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/modules/countries/ui/country_card.dart';

class CountriesList extends StatelessWidget {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  CountriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (countriesStore.isLoading) {
          return Shimmer.fromColors(
            baseColor: AppColors.gray,
            highlightColor: AppColors.shimmerColor,
            child: Wrap(
                runSpacing: 15,
                spacing: 10,
                children: List.generate(4, (index) => CountryCard.loading())),
          );
        }

        return Wrap(
          runSpacing: 15,
          spacing: 10,
          children: countriesStore.countries
              .map(
                (country) => CountryCard.loaded(
                  id: country.id,
                  name: country.name,
                  regions:
                      country.regions.map((region) => region.name).join(" "),
                  image: country.thumbnail.url,
                ),
              )
              .toList(),
        );
      },
    );
  }
}
