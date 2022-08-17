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
    return Expanded(
      child: GridContainer(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 68),
          constraints: const BoxConstraints(minHeight: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.darkBlue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppTextsStyles.headline2Condensed
                    .copyWith(color: AppColors.white),
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
      ),
    );
  }
}
