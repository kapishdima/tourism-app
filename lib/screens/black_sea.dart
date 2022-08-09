import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/models/country.dart';

import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/modules/disqus/ui/disqus.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/locations_grouped_list.dart';
import 'package:sea_of_wine_app/modules/map/ui/map.dart';
import 'package:sea_of_wine_app/modules/ways/store/ways_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/texts/page_title.dart';

class BlackSeaScreen extends StatefulWidget {
  const BlackSeaScreen({Key? key}) : super(key: key);

  @override
  State<BlackSeaScreen> createState() => _BlackSeaScreenState();
}

class _BlackSeaScreenState extends State<BlackSeaScreen> {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final LocalesStore localesStore = appStoresContainer.get<LocalesStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();

  @override
  void initState() {
    super.initState();

    reaction<String>((_) => localesStore.currentLocale,
        (locale) => countriesStore.getCountries(locale: locale));

    locationsStore.getBlackSeaLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (countriesStore.isLoading) {
        return const ColoredBox(
          color: AppColors.white,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.bordo,
              strokeWidth: 2,
            ),
          ),
        );
      }

      return BlackSeaScreenView();
    });
  }
}

class BlackSeaScreenView extends StatelessWidget {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();
  final WaysStore waysStore = appStoresContainer.get<WaysStore>();

  BlackSeaScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      hasBottomNavigation: false,
      children: SingleChildScrollView(
        child: Column(
          children: [
            GridContainer(
                child: PageTitle(
                    title: AppLocalization.of(context)
                        .t("blacksea_screen_title"))),
            const MapWidget(
              isBlackSeaMap: true,
            ),
            const SizedBox(height: AppSizes.defaulPadding),
            CountriesLocationsList(),
            const SizedBox(height: AppSizes.defaulPadding * 2),
            ...buildCountriesInfo(),
            DisqusWidget()
          ],
        ),
      ),
    );
  }

  Iterable<Widget> buildCountriesInfo() {
    List<Country> orderedCountries = [];

    Country urkaine = countriesStore.countries
        .firstWhere((country) => country.name == "Ukraine");
    Country armenia = countriesStore.countries
        .firstWhere((country) => country.name == "Armenia");
    Country greece = countriesStore.countries
        .firstWhere((country) => country.name == "Greece");
    Country georgia = countriesStore.countries
        .firstWhere((country) => country.name == "Georgia");

    orderedCountries.add(urkaine);
    orderedCountries.add(georgia);
    orderedCountries.add(armenia);
    orderedCountries.add(greece);

    return orderedCountries.map(
      (country) => CountryInfo(
        name: country.name,
        text: country.text,
        images: country.gallery.map((country) => country.url).toList(),
      ),
    );
  }
}

class CountryInfo extends StatefulWidget {
  final String name;
  final String text;
  final List<String> images;

  const CountryInfo(
      {Key? key, required this.name, required this.text, required this.images})
      : super(key: key);

  @override
  State<CountryInfo> createState() => _CountryInfoState();
}

class _CountryInfoState extends State<CountryInfo> {
  bool isShownMore = false;
  int textMaxLine = 7;

  double shownContainerHeight = 210;
  double hiddenContainerHeight = 0;

  String showMoreText = "Show more";
  String hideText = "Hide";

  void onShowMoreTap() {
    setState(() {
      isShownMore = !isShownMore;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(bottom: 80),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            "assets/images/black-sea/ukraine-map.svg",
            fit: BoxFit.cover,
          ),
          Text(
            widget.name,
            style: AppTextsStyles.countryTitle.copyWith(color: AppColors.dark),
          ),
          Container(
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 10),
            color: AppColors.gray,
          ),
          Text(
            widget.text,
            style: AppTextsStyles.paragraph.copyWith(
              color: AppColors.dark,
            ),
            overflow: TextOverflow.fade,
            maxLines: isShownMore ? null : textMaxLine,
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            height: isShownMore ? 210 : 0,
            child: Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 20),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    String image = widget.images[index];
                    return SizedBox(
                      width: 150,
                      height: 210,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 10,
                      ),
                  itemCount: widget.images.length),
            ),
          ),
          GestureDetector(
            onTap: onShowMoreTap,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                isShownMore ? hideText : showMoreText,
                style: AppTextsStyles.paragraph.copyWith(
                    color: AppColors.superGray,
                    decoration: TextDecoration.underline),
              ),
            ),
          )
        ],
      ),
    );
  }
}
