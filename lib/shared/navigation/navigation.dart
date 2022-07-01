import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'router.dart';

class AppNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigator;

  const AppNavigator({Key? key, required this.navigator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.initialRoute,
      getPages: Routes.routes.map((route) => GetPage(name: route.path, page: route.page)).toList(),
    );
  }
}
