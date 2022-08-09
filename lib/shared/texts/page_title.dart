import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Text(title,
          style: AppTextsStyles.pageTitle.copyWith(color: AppColors.dark)),
    );
  }
}
