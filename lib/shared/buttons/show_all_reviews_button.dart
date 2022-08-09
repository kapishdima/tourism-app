import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class ShowAllReviews extends StatelessWidget {
  const ShowAllReviews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/reviews");
          },
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.dark),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12)),
          child: Text(
            AppLocalization.of(context).t("show_all_reviews"),
            style: AppTextsStyles.headline3Condensed
                .copyWith(color: AppColors.dark),
          )),
    );
  }
}
