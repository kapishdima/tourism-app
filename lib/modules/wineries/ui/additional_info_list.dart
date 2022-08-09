import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class AdditionalInfo {
  final String icon;
  final String title;
  final String text;

  AdditionalInfo({required this.icon, required this.title, required this.text});
}

const int showElementLength = 4;

class AdditionalInfoList extends StatefulWidget {
  final Map<String, String?> additionalInfo;

  const AdditionalInfoList({
    Key? key,
    required this.additionalInfo,
  }) : super(key: key);

  @override
  State<AdditionalInfoList> createState() => _AdditionalInfoListState();
}

class _AdditionalInfoListState extends State<AdditionalInfoList> {
  List<AdditionalInfo> additionalInfo = [];
  final List<String> icons = [
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

  bool isAllShown = false;

  void prepareAdditionalInfo() {
    int index = 0;
    List<AdditionalInfo> items = [];

    widget.additionalInfo.forEach((key, value) {
      items.add(
        AdditionalInfo(icon: icons[index], title: key, text: value ?? ""),
      );
      index++;
    });

    setState(() {
      additionalInfo = items;
    });
  }

  @override
  void initState() {
    super.initState();

    prepareAdditionalInfo();
  }

  @override
  Widget build(BuildContext context) {
    return GridContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalization.of(context).t("additional_info_title"),
            style: AppTextsStyles.headline2Condensed
                .copyWith(color: AppColors.dark),
          ),
          const SizedBox(height: 20),
          Wrap(
            runSpacing: 15,
            children: additionalInfo
                .getRange(
                    0,
                    isAllShown
                        ? widget.additionalInfo.length
                        : showElementLength)
                .map((item) => buildAdditionalInfoItem(
                    title: item.title, icon: item.icon, text: item.text))
                .toList(),
          ),
          buildMoreButton()
        ],
      ),
    );
  }

  Row buildMoreButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              isAllShown = !isAllShown;
            });
          },
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 25)),
          child: Text(
            isAllShown
                ? AppLocalization.of(context).t("show_less_text")
                : AppLocalization.of(context).t("show_more_text"),
            style: AppTextsStyles.paragraph.copyWith(
                color: AppColors.dark, decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }

  Container buildAdditionalInfoItem(
      {required String title, required String icon, required String text}) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColors.gray, width: 1, style: BorderStyle.solid))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: SvgPicture.asset(icon),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextsStyles.paragraphMedium
                        .copyWith(color: AppColors.dark),
                  ),
                  Text(
                    text,
                    style: AppTextsStyles.paragraph
                        .copyWith(color: AppColors.superGray),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
