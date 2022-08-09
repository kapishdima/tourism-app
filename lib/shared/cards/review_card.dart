import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class ReviewCard extends StatelessWidget {
  final String authorImage;
  final String authorName;
  final String text;
  final double rating;
  final String date;

  const ReviewCard({
    Key? key,
    required this.authorImage,
    required this.authorName,
    required this.text,
    required this.rating,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.58,
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 25),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Row(
            children: [
              buildAvatar(),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName,
                        style: AppTextsStyles.paragraphMedium
                            .copyWith(color: AppColors.dark)),
                    buildRating(),
                    Text(
                      date,
                      style: AppTextsStyles.label.copyWith(
                        color: AppColors.darkGray,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: ParagraphText(
              text:
                  "Choose your itinerary. Armenia, Georgia and Greece to develop a brand of wine tourism in the Black Sea region.",
            ),
          )
        ],
      ),
    );
  }

  Row buildRating() {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/icons/star_icon.svg",
          width: 12,
          color: AppColors.bordo,
        ),
        Text(
          rating.toString(),
          style: AppTextsStyles.label.copyWith(color: AppColors.dark),
        )
      ],
    );
  }

  ClipRRect buildAvatar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(authorImage), fit: BoxFit.cover)),
      ),
    );
  }
}
