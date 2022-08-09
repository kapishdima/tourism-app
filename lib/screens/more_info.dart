import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/cards/more_info_card.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/buttons/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfoItem {
  final String name;
  final String url;
  final String image;

  MoreInfoItem({required this.name, required this.url, required this.image});
}

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({Key? key}) : super(key: key);

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  List<MoreInfoItem> moreInfoItems = [];

  @override
  void initState() {
    super.initState();

    moreInfoItems = [
      MoreInfoItem(
          name: "events_card_title",
          url:
              "${MoreInfoUrls.siteUrl}countries/${countriesStore.currentName}/${MoreInfoUrls.eventsUrl}",
          image: "assets/images/more_info/more_info-0.png"),
      MoreInfoItem(
          name: "agencies_card_title",
          url:
              "${MoreInfoUrls.siteUrl}countries/${countriesStore.currentName}/${MoreInfoUrls.agenciesUrl}",
          image: "assets/images/more_info/more_info-1.png"),
      MoreInfoItem(
          name: "grape_card_title",
          url:
              "${MoreInfoUrls.siteUrl}countries/${countriesStore.currentName}/${MoreInfoUrls.grapesUrl}",
          image: "assets/images/more_info/more_info-2.png"),
      MoreInfoItem(
          name: "blog_card_title",
          url: "${MoreInfoUrls.siteUrl}/${MoreInfoUrls.blogUrl}",
          image: "assets/images/more_info/more_info-3.png"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
        title: AppLocalization.of(context).t("more_info_title"),
        children: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  runSpacing: 14,
                  children: moreInfoItems
                      .map(
                        (moreInfoItem) => MoreInfoCard(
                            name: AppLocalization.of(context)
                                .t(moreInfoItem.name),
                            url: moreInfoItem.url,
                            image: moreInfoItem.image),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 58, bottom: 90),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SocialButton(
                                icon: "assets/icons/instagram-icon.svg",
                                url: "https://www.instagram.com/"),
                            SizedBox(width: 10),
                            SocialButton(
                                icon: "assets/icons/facebook-icon.svg",
                                url: "https://uk-ua.facebook.com/"),
                          ],
                        ),
                      ),
                      Text(
                        AppLocalization.of(context).t("footer_text"),
                        style: AppTextsStyles.smallTextLight
                            .copyWith(color: AppColors.dark),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse("${ApiSettings.baseUrl}privacy"),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: Text(
                                  AppLocalization.of(context)
                                      .t("footer_privacy_link"),
                                  style: AppTextsStyles.smallTextMedium
                                      .copyWith(
                                          color: AppColors.dark,
                                          decoration:
                                              TextDecoration.underline)),
                            ),
                            Text(
                              "© 2022",
                              style: AppTextsStyles.copyrightText
                                  .copyWith(color: AppColors.dark),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
