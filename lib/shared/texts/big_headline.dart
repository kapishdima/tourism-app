import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class BigHeadline extends StatelessWidget {
  final String text;
  const BigHeadline({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppTextsStyles.headline2
            .copyWith(color: AppColors.dark));
  }
}
