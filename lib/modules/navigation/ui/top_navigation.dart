import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      actions: [
        Row(
          children: [
            Text("En", style: AppTextsStyles.label.copyWith(color: AppColors.dark))
          ],
        )
      ],
    );
  }
}
