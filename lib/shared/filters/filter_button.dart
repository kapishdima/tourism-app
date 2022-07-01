
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class FiltersButton extends StatelessWidget {
  const FiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Builder(builder: (context) {
        return FloatingActionButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          backgroundColor: AppColors.white,
          child: SvgPicture.asset("assets/icons/filters_icon.svg"),
        );
      }),
    );
  }
}
