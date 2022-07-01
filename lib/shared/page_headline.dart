
import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class PageHeadline extends StatelessWidget {
  const PageHeadline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Ukraine",
      style: TextStyle(
        fontFamily: "NotoSansDisplay_Condensed",
        fontSize: 55,
        color: AppColors.dark
      )
    );
  }
}