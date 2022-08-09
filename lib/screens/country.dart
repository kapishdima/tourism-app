import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sea_of_wine_app/modules/countries/models/country.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/map.dart';
import 'package:sea_of_wine_app/modules/ways/ui/way_list.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/image_slider.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/texts/page_title.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class CountryScreen extends StatelessWidget {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  CountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final Country country =
            countriesStore.getCountryById(countriesStore.currentCountry);

        return Layout(
          children: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridContainer(
                  child: PageTitle(
                    title: country.name,
                  ),
                ),
                const MapWidget(),
                const Padding(
                  padding: EdgeInsets.only(
                    left: AppSizes.defaulPadding,
                    top: AppSizes.defaulPadding,
                    bottom: 40,
                  ),
                  child: WaysList(type: WaysListTypes.horizontal),
                ),
                GridContainer(
                  child: ParagraphText(text: country.text),
                ),
                ImageSlider(
                  images: country.gallery.map((image) => image.url).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
