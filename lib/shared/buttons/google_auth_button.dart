import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class GoogleAuthButton extends StatelessWidget {
  const GoogleAuthButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
                side: const BorderSide(color: AppColors.superGray)),
            padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/google-auth_icon.svg"),
            const SizedBox(
              width: 10,
            ),
            Text(AppLocalization.of(context).t("google_button_text"),
                style: AppTextsStyles.paragraph
                    .copyWith(color: AppColors.dark))
          ],
        ));
  }
}
