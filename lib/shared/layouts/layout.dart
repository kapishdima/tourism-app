import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/modules/navigation/ui/bottom_navigation.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

import 'package:sea_of_wine_app/modules/locales/ui/locales_dropdown.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class Layout extends StatelessWidget {
  final Widget children;
  final String? title;
  final bool hasBottomNavigation;

  const Layout(
      {Key? key,
      required this.children,
      this.title,
      this.hasBottomNavigation = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children,
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        title: Text(title ?? "",
            style: AppTextsStyles.paragraph.copyWith(color: AppColors.dark)),
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/angle_left.svg"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: const [LocalesDropdown()],
      ),
      bottomNavigationBar:
          hasBottomNavigation ? const BottomNavigation() : null,
    );
  }
}
