import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/navigation/store/navigation_store.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/router.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
      width: size.width,
      height: 55,
      padding: const EdgeInsets.only(top: 12),
      decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(top: BorderSide(color: AppColors.gray))),
      child: Row(
        children: AppRouter.bottomNavigationRoutes
            .map((route) => BottomNavigationItem(
                  label: route.label,
                  icon: route.icon,
                  path: route.path,
                ))
            .toList(),
      ),
    ));
  }
}

class BottomNavigationItem extends StatelessWidget {
  final NavigationStore navigationStore =
      appStoresContainer.get<NavigationStore>();

  final String label;
  final String icon;
  final String path;

  BottomNavigationItem({
    Key? key,
    required this.label,
    required this.icon,
    required this.path,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final Color activeColor = navigationStore.isCurrentRoute(path)
          ? AppColors.bordo
          : AppColors.dark;

      return Expanded(
          child: GestureDetector(
        onTap: () {
          navigationStore.changeRoute(path);
          Navigator.pushNamed(context, path);
        },
        child: Column(
          children: [
            SvgPicture.asset(
              icon,
              color: activeColor,
            ),
            Expanded(
              child: Text(AppLocalization.of(context).t(label),
                  style: AppTextsStyles.label.copyWith(color: activeColor)),
            )
          ],
        ),
      ));
    });
  }
}
