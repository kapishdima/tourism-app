import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/modules/map/ui/filters/filters_modal.dart';
import 'package:sea_of_wine_app/screens/black_sea.dart';
import 'package:sea_of_wine_app/screens/country.dart';
import 'package:sea_of_wine_app/screens/home.dart';
import 'package:sea_of_wine_app/screens/more_info.dart';
import 'package:sea_of_wine_app/screens/reviews.dart';
import 'package:sea_of_wine_app/screens/route.dart';
import 'package:sea_of_wine_app/screens/routes.dart';
import 'package:sea_of_wine_app/screens/wineries.dart';
import 'package:sea_of_wine_app/screens/winery.dart';

abstract class ScreenFactory {
  static const Widget homeScreen = HomeScreen();
  static final Widget wineriesScreen = WineriesScreen();
  static const Widget wineryScreen = WineryScreen();
  static final Widget routesScreen = RoutesScreen();
  static const Widget routeScreen = RouteScreen();
  static final Widget moreInfoScreen = MoreInfoScreen();
  static final Widget countryScreen = CountryScreen();
  static final Widget reviewsScreen = ReviewsScreen();
  static final Widget filtersScreen = FiltersModal();
  static final Widget blackSeaScreen = BlackSeaScreen();
}
