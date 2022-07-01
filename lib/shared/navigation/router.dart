import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sea_of_wine_app/screens/home.dart';
import 'package:sea_of_wine_app/screens/wineries.dart';
import 'package:sea_of_wine_app/screens/more_info.dart';
import 'package:sea_of_wine_app/screens/routes.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class Route {
  final String path;
  final Widget Function() page;
  final Widget Function(bool) icon;
  final String label;

  Route(this.path, this.page, this.icon, this.label);
}

class Routes {
  static String get initialRoute {
    return routes[0];
  }

  static final List<String> routes = [
    "/",
    "/wineries",
    "/routes",
    "/more_info",
    '/country'
  ];

  static final List<Route> bottomNavigationRoutes = [
    Route(
        "/",
        () => const HomeScreen(),
        (bool isActive) => SvgPicture.asset(
              "assets/icons/home_icon.svg",
              color: isActive ? AppColors.bordo : AppColors.dark,
            ),
        "Main"),
    Route(
        "/wineries",
        () => const WineriesScreen(),
        (bool isActive) => SvgPicture.asset("assets/icons/wineries_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        "Wineries"),
    Route(
        "/routes",
        () => const RoutesScreen(),
        (bool isActive) => SvgPicture.asset("assets/icons/routes_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        "Routes"),
    Route(
        "/more_info",
        () => const MoreInfoScreen(),
        (bool isActive) => SvgPicture.asset("assets/icons/more_info_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        "More Info"),
  ];
}
