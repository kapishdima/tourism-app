import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class MapButton extends StatelessWidget {
  final void Function() onPressed;
  final bool isOpened;

  static const hideMapOffset = Offset(0, 1);
  static const shownMapOffset = Offset(0, -0.2);

  const MapButton({
    Key? key,
    required this.onPressed,
    required this.isOpened,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      curve: Curves.ease,
      offset: isOpened ? shownMapOffset : hideMapOffset,
      duration: const Duration(milliseconds: 250),
      child: SizedBox(
        width: 85,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: AppColors.dark)),
              backgroundColor: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/paper-map_icon.svg"),
              const SizedBox(width: 5),
              Text(
                "Map",
                style: AppTextsStyles.mapButtonText
                    .copyWith(color: AppColors.dark),
              )
            ],
          ),
        ),
      ),
    );
  }
}
