import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class ParagraphText extends StatelessWidget {
  final String text;
  final Color color;
  const ParagraphText({Key? key, required this.text, this.color = AppColors.dark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppTextsStyles.paragraph.copyWith(color: color));
  }
}
