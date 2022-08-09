import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';

class RatingRow extends StatelessWidget {
  final maxRatingCount = 5;
  final double ratingCount;
  const RatingRow({Key? key, required this.ratingCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        maxRatingCount,
        (index) => SvgPicture.asset(
          "assets/icons/star_icon.svg",
          width: 14,
          height: 14,
          color: index < ratingCount ? AppColors.bordo : AppColors.gray,
        ),
      ),
    );
  }
}
