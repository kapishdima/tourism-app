import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class ReviewFullCard extends StatelessWidget {
  final String authorImage;
  final String authorName;
  final String text;
  final String date;
  final double rating;

  const ReviewFullCard({
    Key? key,
    required this.authorImage,
    required this.authorName,
    required this.text,
    required this.date,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.gray)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(authorImage), fit: BoxFit.cover)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(authorName,
                        style: AppTextsStyles.paragraphMedium
                            .copyWith(color: AppColors.dark)),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/star_icon.svg",
                          width: 12,
                          color: AppColors.bordo,
                        ),
                        Text(
                          rating.toString(),
                          style: AppTextsStyles.label
                              .copyWith(color: AppColors.dark),
                        )
                      ],
                    ),
                    Text(
                      date,
                      style: AppTextsStyles.label
                          .copyWith(color: AppColors.darkGray),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: ParagraphText(text: text),
          )
        ],
      ),
    );
  }
}
