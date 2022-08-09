import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

final Map<String, TextStyle> styles = {
  "p": AppTextsStyles.paragraph.copyWith(color: AppColors.dark),
  "b": AppTextsStyles.paragraph.copyWith(fontWeight: FontWeight.bold),
  "i": AppTextsStyles.paragraph.copyWith(fontStyle: FontStyle.italic),
  "u": AppTextsStyles.paragraph.copyWith(decoration: TextDecoration.underline),
  "strong": AppTextsStyles.paragraph.copyWith(fontWeight: FontWeight.bold),
};

class HtmlText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final int? maxLines;
  final TextOverflow? overflow;

  const HtmlText(
      {Key? key,
      required this.text,
      required this.style,
      this.maxLines,
      this.overflow})
      : super(key: key);

  String getTagFromHTML() {
    RegExpMatch? match = RegExp('<(.*?)>').firstMatch(text);
    return match == null ? "" : match.group(1) ?? "p";
  }

  String getTagContentFromHTML(String tag) {
    RegExpMatch? match = RegExp('<$tag>(.*?)</$tag>').firstMatch(text);
    return match == null ? "" : match.group(1) ?? "";
  }

  @override
  Widget build(BuildContext context) {
    if (getTagFromHTML().isEmpty) {
      return Text(
        text,
        style: AppTextsStyles.paragraph.copyWith(color: AppColors.dark),
        maxLines: maxLines,
        overflow: overflow,
      );
    }

    return Text(
      getTagContentFromHTML(getTagFromHTML()),
      style: styles[getTagFromHTML()]!.merge(style),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
