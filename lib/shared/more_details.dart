import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class MoreDetails extends StatelessWidget {
  final VoidCallback onTap;
  const MoreDetails({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          AppLocalization.of(context).t("more_details"),
          style: AppTextsStyles.paragraphMedium.copyWith(
              decoration: TextDecoration.underline, color: AppColors.dark),
        ),
      ),
    );
  }
}
