import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sea_of_wine_app/modules/locales/model/locale.dart';
import 'package:sea_of_wine_app/modules/locales/store/locales_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

class LocalesDropdown extends StatefulWidget {
  const LocalesDropdown({
    Key? key,
  }) : super(key: key);

  @override
  State<LocalesDropdown> createState() => _LocalesDropdownState();
}

class _LocalesDropdownState extends State<LocalesDropdown> {
  LocalesStore localesStore = appStoresContainer.get<LocalesStore>();

  Offset popupMenuOffset = const Offset(0, 0);
  double popupMenuWidth = 32;

  @override
  void initState() {
    super.initState();

    localesStore.getLocales();
  }

  void onLocaleChange(String? locale) {
    localesStore.setCurrentLocale(locale ?? localesStore.generalLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (localesStore.isLoading) {
        return buildLocaleLoader();
      }
      return Padding(
        padding: const EdgeInsets.only(right: AppSizes.defaulPadding),
        child: PopupMenuButton(
          elevation: 0,
          offset: popupMenuOffset,
          constraints:
              BoxConstraints(maxWidth: popupMenuWidth, minWidth: popupMenuWidth),
          onSelected: onLocaleChange,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.gray),
            borderRadius: BorderRadius.circular(3),
          ),
          itemBuilder: (context) => localesStore.locales
              .map((locale) => buildPopupMenu(locale))
              .toList(),
          child: buildSelectedLanguage(),
        ),
      );
    });
  }

  Padding buildLocaleLoader() {
    return const Padding(
      padding: EdgeInsets.only(right: AppSizes.defaulPadding),
      child: Center(
          child: SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(
              color: AppColors.bordo,
              strokeWidth: 2,
            ),
          ),
        ),
    );
  }

  Row buildSelectedLanguage() {
    return Row(
      children: [
        Text(
          localesStore.currentLocale.toUpperCase(),
          style: AppTextsStyles.paragraphMedium.copyWith(color: AppColors.dark),
        ),
        const SizedBox(
          width: 4,
        ),
        SvgPicture.asset("assets/icons/angle_down.svg")
      ],
    );
  }

  PopupMenuItem<String> buildPopupMenu(Locale locale) {
    return PopupMenuItem<String>(
      height: 28,
      padding: const EdgeInsets.all(0),
      value: locale.code,
      child: Center(
        child: Text(
          locale.code.toUpperCase(),
          style: AppTextsStyles.paragraphMedium.copyWith(
              color: localesStore.currentLocale == locale.code
                  ? AppColors.bordo
                  : AppColors.dark,
              decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}
