import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/screens/screen_factory.dart';

class Route {
  final String path;
  final Widget Function() page;

  Route({required this.path, required this.page});
}

class BottomMenuItem {
  final String path;
  final String icon;
  final String label;

  BottomMenuItem({required this.path, required this.icon, required this.label});
}

abstract class AppRouter {
  static String get initialRoute {
    return "/";
  }

  static final Map<String, WidgetBuilder> routes = {
    "/": (BuildContext context) => ScreenFactory.homeScreen,
    "/wineries": (BuildContext context) => ScreenFactory.wineriesScreen,
    "/winery": (BuildContext context) => ScreenFactory.wineryScreen,
    "/route": (BuildContext context) => ScreenFactory.routeScreen,
    "/routes": (BuildContext context) => ScreenFactory.routesScreen,
    "/more_info": (BuildContext context) => ScreenFactory.moreInfoScreen,
    "/country": (BuildContext context) => ScreenFactory.countryScreen,
    "/reviews": (BuildContext context) => ScreenFactory.reviewsScreen,
    "/filters": (BuildContext context) => ScreenFactory.filtersScreen,
    "/black-sea": (BuildContext context) => ScreenFactory.blackSeaScreen,
  };

  static final List<BottomMenuItem> bottomNavigationRoutes = [
    BottomMenuItem(
        path: "/", icon: "assets/icons/navigations/home_icon.svg", label: "navigation_home"),
    BottomMenuItem(
        path: "/wineries", // /wineries
        icon: "assets/icons/navigations/wineries_icon.svg",
        label: "navigation_wineries"),
    BottomMenuItem(
        path: "/routes", // /route
        icon: "assets/icons/navigations/routes_icon.svg",
        label: "navigation_routes"),
    BottomMenuItem(
        path: "/more_info",
        icon: "assets/icons/navigations/more_info_icon.svg",
        label: "navigation_more_info"),
  ];
}
