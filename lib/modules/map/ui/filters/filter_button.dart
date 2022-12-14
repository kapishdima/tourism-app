import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';

class FiltersButton extends StatelessWidget {
  const FiltersButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, "/filters"),
          child: Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
                color: AppColors.white, shape: BoxShape.circle),
            child: Center(
              child: SvgPicture.asset(
                "assets/icons/filters_icon.svg",
                height: 20,
                width: 20,
              ),
            ),
          ),
        );
      }),
    );
  }
}
