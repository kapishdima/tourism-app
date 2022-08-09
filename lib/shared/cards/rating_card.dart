import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';

class RatingCard extends StatelessWidget {
  final String name;
  final double rating;

  const RatingCard({
    Key? key,
    required this.name,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridContainer(
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.darkBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 170),
              child: Text(
                name,
                style: AppTextsStyles.headline2Condensed
                    .copyWith(color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/star_icon.svg", width: 55),
                const SizedBox(width: 16),
                Text(
                  rating.toString(),
                  style: AppTextsStyles.ratingTitle
                      .copyWith(color: AppColors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
