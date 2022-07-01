import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/route_manager.dart';

import 'package:sea_of_wine_app/shared/languages.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class Layout extends StatelessWidget {
  final Widget children;

  const Layout({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/angle_left.svg"),
          onPressed: () {
            Get.back();
          },
        ),
        actions: const [
          Languges()
        ],
      ),
    );
  }
}
