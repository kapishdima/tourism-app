import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';

import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

import 'package:sea_of_wine_app/shared/cards/black_sea_card.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/layouts/home_layout.dart';
import 'package:sea_of_wine_app/modules/countries/ui/countries_list.dart';
import 'package:sea_of_wine_app/shared/lists/partners_list.dart';
import 'package:sea_of_wine_app/shared/texts/page_title.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CountriesStore countriesStore = appStoresContainer.get<CountriesStore>();
  LocalesStore localesStore = appStoresContainer.get<LocalesStore>();

  @override
  void initState() {
    super.initState();

    reaction<String>((_) => localesStore.currentLocale, (locale) {
      countriesStore.getCountries(locale: locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreenView();
  }
}

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      child: SingleChildScrollView(
        child: GridContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(
                title: AppLocalization.of(context)
                    .t("home_screen_title")
                    .toString(),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: BlackSeaCard(),
              ),
              CountriesList(),
              buildPromoText(context),
              const PartnersList(),
              const SizedBox(
                height: 60,
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildPromoText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSizes.defaulPadding * 2, bottom: AppSizes.defaulPadding),
      child: Wrap(
        runSpacing: 20,
        children: [
          RichText(
            text: TextSpan(
              text: AppLocalization.of(context).t("home_title"),
              style: AppTextsStyles.headline2Condensed
                  .copyWith(color: AppColors.dark),
              children: [
                TextSpan(
                  text: AppLocalization.of(context).t("implemented_text"),
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
          ParagraphText(
            text: AppLocalization.of(context).t("home_text"),
          )
        ],
      ),
    );
  }
}
