import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'router.dart';
import '/settings/constans.dart';

class BottomNavigation extends StatefulWidget {
  final GlobalKey<NavigatorState> navigator;
  const BottomNavigation({Key? key, required this.navigator}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentNavigation = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
          border: Border(
              top: BorderSide(
                  width: 1, color: AppColors.gray, style: BorderStyle.solid)),
          color: AppColors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: buildNavigationList(context),
      ),
    );
  }

  List<GestureDetector> buildNavigationList(BuildContext context) {
    void navigateToScreen(String path, int index) {
      if (currentNavigation != index) {
        setState(() {
          currentNavigation = index;
        });

        Get.toNamed(path);
      }
    }

    return Routes.bottomNavigationRoutes.map((item) {
      int index = Routes.bottomNavigationRoutes.indexOf(item);
      bool isActive = index == currentNavigation;

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          navigateToScreen(item.path, index);
        },
        child: Column(
          children: [
            item.icon(isActive),
            Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(item.label,
                    style: TextStyle(
                        color: !isActive ? AppColors.dark : AppColors.bordo,
                        fontFamily: "NotoSansDisplay_Condensed",
                        fontWeight:
                            !isActive ? FontWeight.w400 : FontWeight.w500)))
          ],
        ),
      );
    }).toList();
  }
}
