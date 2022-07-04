import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

class ParagraphText extends StatelessWidget {
  final String text;
  const ParagraphText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: AppTheme.ligthTheme.textTheme.bodyText1!
            .copyWith(color: AppColors.dark));
  }
}
