
import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

import 'settings/constans.dart';
import 'shared/navigation/bottom_navigation.dart';
import 'shared/navigation/navigation.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

    final navigator = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sea of Wine',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.ligthTheme,
      home: Scaffold(
        body: AppNavigator(navigator: navigator),
        backgroundColor: AppColors.white,
        bottomNavigationBar: BottomNavigation(navigator: navigator),
      )
    );
  }
}