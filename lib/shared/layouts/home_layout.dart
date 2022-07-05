import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sea_of_wine_app/shared/languages.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class HomeLayout extends StatelessWidget {
  final Widget children;

  const HomeLayout({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30),
        child: SizedBox(
          width: size.width - 60,
          child: children,
        ),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        toolbarHeight: AppSizes.appBarHeight,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [SvgPicture.asset("assets/logo.svg")]),
        actions: const [Languges()],
      ),
    );
  }
}
