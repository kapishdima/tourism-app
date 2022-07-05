import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/cards/more_info_card.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/social_button.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfoItem {
  final String name;
  final String url;
  final String image;

  MoreInfoItem({required this.name, required this.url, required this.image});
}

class MoreInfoScreen extends StatelessWidget {
  final List<MoreInfoItem> moreInfoItems = [
    MoreInfoItem(
        name: "Events",
        url: "https://seaofwine.travel/",
        image: "assets/images/more_info/more_info-0.png"),
    MoreInfoItem(
        name: "Travel Agensies",
        url: "https://seaofwine.travel/",
        image: "assets/images/more_info/more_info-1.png"),
    MoreInfoItem(
        name: "Grape varieties",
        url: "https://seaofwine.travel/",
        image: "assets/images/more_info/more_info-2.png"),
    MoreInfoItem(
        name: "Blog",
        url: "https://seaofwine.travel/",
        image: "assets/images/more_info/more_info-3.png"),
  ];

  MoreInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        title: "More Info",
        children: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  runSpacing: 14,
                  children: moreInfoItems
                      .map((moreInfoItem) => MoreInfoCard(
                          name: moreInfoItem.name,
                          url: moreInfoItem.url,
                          image: moreInfoItem.image))
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
                      const Text(
                        "This website/platform was created and maintained with the financial support of the European Union. Its contents are the sole responsibility of and do not necessarily reflect the views of the European Union",
                        style: TextStyle(
                            fontFamily: "NotoSansDisplay",
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            color: AppColors.dark),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await launchUrl(
                                    Uri.parse("https://seaofwine.travel/"),
                                    mode: LaunchMode.externalApplication);
                              },
                              child: const Text("Privacy policy",
                                  style: TextStyle(
                                      fontFamily: "NotoSansDisplay",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.dark,
                                      decoration: TextDecoration.underline)),
                            ),
                            const Text(
                              "© 2022",
                              style: TextStyle(
                                fontFamily: "NotoSansDisplay",
                                fontWeight: FontWeight.w300,
                                color: AppColors.dark,
                              ),
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
        )));
  }
}
