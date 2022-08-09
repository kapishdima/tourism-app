import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

import 'package:sea_of_wine_app/shared/buttons/facebook_auth_button.dart';
import 'package:sea_of_wine_app/shared/buttons/google_auth_button.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';

class SocialLoginCard extends StatelessWidget {
  const SocialLoginCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridContainer(
      child: Container(
        padding:
            const EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 40),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.gray),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(AppLocalization.of(context).t("login_title"),
                style:
                    AppTextsStyles.headline2Condensed.copyWith(color: AppColors.dark)),
            const SizedBox(
              height: 14,
            ),
            const FacebookAuthButton(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                AppLocalization.of(context).t("login_or"),
                style: AppTextsStyles.paragraph
                    .copyWith(color: AppColors.superGray),
              ),
            ),
            const GoogleAuthButton()
          ],
        ),
      ),
    );
  }
}
