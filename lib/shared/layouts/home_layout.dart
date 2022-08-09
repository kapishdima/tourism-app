import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';

import 'package:sea_of_wine_app/modules/locales/ui/locales_dropdown.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class HomeLayout extends StatelessWidget {
  final Widget child;

  const HomeLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor: AppColors.white,
      appBar: buiildAppBar(),
    );
  }

  AppBar buiildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      toolbarHeight: AppSizes.appBarHeight,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [SvgPicture.asset("assets/logo.svg")]),
      actions: const [LocalesDropdown()],
    );
  }
}
