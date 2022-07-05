import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

class AdditionalInfo {
  final String icon;
  final String title;
  final String text;

  AdditionalInfo({required this.icon, required this.title, required this.text});
}

class AdditionalInfoList extends StatelessWidget {
  final Map<int, String> additionalValues;
  final List<String> icons = [
    "assets/icons/tel_icon.svg",
    "assets/icons/clock_icon.svg",
    "assets/icons/planet_icon.svg",
    "assets/icons/map_icon.svg",
    "assets/icons/ruler_icon.svg",
    "assets/icons/wineglass_icon.svg",
    "assets/icons/wineries_icon.svg",
    "assets/icons/route_icon.svg",
    "assets/icons/botle_icon.svg",
    "assets/icons/card_icon.svg",
    "assets/icons/bad_icon.svg",
  ];

  final List<String> titles = [
    "How do tourists book a wine tour?",
    "Is the winery open to visitors: ",
    "Which languages does the staff speak?",
    "Regions:",
    "Size of the winery:",
    "Wine categories:",
    "Grape Varieties used for production:",
    "Wine Routes:",
    "Wine Tour Options:",
    "Paying possibilities: ",
    "Sleeping posibilities:",
  ];

  AdditionalInfoList({
    Key? key,
    required this.additionalValues,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<AdditionalInfo> additionalInfo = [];

    additionalValues.forEach((key, value) {
      additionalInfo.add(
          AdditionalInfo(icon: icons[key], title: titles[key], text: value));
    });

    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text("Additional information",
                style: AppTheme.ligthTheme.textTheme.headline2!
                    .copyWith(color: AppColors.dark)),
          ),
          Wrap(
            runSpacing: 15,
            children: additionalInfo.map((item) => buildAdditionalInfoItem(title: item.title, icon: item.icon, text: item.text)).toList(),
          )
        ],
      ),
    );
  }

  Container buildAdditionalInfoItem({required String title, required String icon, required String text}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray, width: 1, style: BorderStyle.solid))
      ),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(icon),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontFamily: "NotoSansDisplay",
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.dark),
                ),
                Text(text,
                    style: AppTheme.ligthTheme.textTheme.bodyText1!
                        .copyWith(color: AppColors.dark)),
              ],
            )
          ],
        ),
    );
  }
}
