import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/screens/country.dart';

import 'package:sea_of_wine_app/screens/home.dart';
import 'package:sea_of_wine_app/screens/wineries.dart';
import 'package:sea_of_wine_app/screens/more_info.dart';
import 'package:sea_of_wine_app/screens/routes.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class Route {
  final String path;
  final Widget Function() page;

  Route({required this.path, required this.page});
}

class BottomMenuItem {
  final String path;
  final Widget Function(bool) icon;
  final String label;

  BottomMenuItem({required this.path, required this.icon, required this.label});
}

class Routes {
  static String get initialRoute {
    return routes[0].path;
  }

  static final List<Route> routes = [
    Route(path: "/", page: () => const HomeScreen()),
    Route(path: "/wineries", page: () => const WineriesScreen()),
    Route(path: "/routes", page: () => const RoutesScreen()),
    Route(path: "/more_info", page: () => const MoreInfoScreen()),
    Route(path: "/country", page: () => const CountryScreen()),
  ];

  static final List<BottomMenuItem> bottomNavigationRoutes = [
    BottomMenuItem(
        path: "/",
        icon: (bool isActive) => SvgPicture.asset(
              "assets/icons/home_icon.svg",
              color: isActive ? AppColors.bordo : AppColors.dark,
            ),
        label: "Main"),
    BottomMenuItem(
        path: "/wineries",
        icon: (bool isActive) => SvgPicture.asset(
            "assets/icons/wineries_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        label: "Wineries"),
    BottomMenuItem(
        path: "/routes",
        icon: (bool isActive) => SvgPicture.asset(
            "assets/icons/routes_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        label: "Routes"),
    BottomMenuItem(
        path: "/more_info",
        icon: (bool isActive) => SvgPicture.asset(
            "assets/icons/more_info_icon.svg",
            color: isActive ? AppColors.bordo : AppColors.dark),
        label: "More Info"),
  ];
}
