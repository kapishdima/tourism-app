import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/html_text.dart';
import 'package:sea_of_wine_app/shared/more_details.dart';
import 'package:shimmer/shimmer.dart';

class WayCardConfiguration {
  final int id;
  final String name, image, description;
  final VoidCallback onCardTap;
  final VoidCallback onLinkTap;
  final bool isSelected;

  WayCardConfiguration({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.isSelected,
    required this.onCardTap,
    required this.onLinkTap,
  });
}

abstract class WayCard extends StatelessWidget {
  const WayCard({Key? key}) : super(key: key);

  factory WayCard.loading() => const WayCardLoading();
  factory WayCard.loaded({required WayCardConfiguration configuration}) =>
      WayCardLoaded(configuration: configuration);
}

class WayCardLoading extends WayCard {
  const WayCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.shimmerColor,
      child: SizedBox(
        width: size.width * 0.55,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageRect(),
            const SizedBox(
              height: 15,
            ),
            buildTextRect(),
            const SizedBox(
              height: 25,
            ),
            ...List.generate(4, (index) {
              return Column(
                children: [
                  buildTextRect(),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              );
            })
          ],
        ),
      ),
    );
  }

  Container buildTextRect() {
    return Container(
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: AppColors.gray),
    );
  }

  Container buildImageRect() {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.gray),
    );
  }
}

class WayCardLoaded extends WayCard {
  final WayCardConfiguration configuration;

  const WayCardLoaded({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: 170,
      child: GestureDetector(
        onTap: configuration.onCardTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImage(size),
            const SizedBox(
              height: 10,
            ),
            buildText(size),
            buildFooter()
          ],
        ),
      ),
    );
  }

  Wrap buildText(Size size) {
    return Wrap(
      runSpacing: 10,
      children: [
        SizedBox(
          width: size.width,
          child: Text(
            configuration.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTextsStyles.headline3Condensed.copyWith(
                color: configuration.isSelected
                    ? AppColors.bordo
                    : AppColors.dark),
          ),
        ),
        HtmlText(
          text: configuration.description,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: AppTextsStyles.paragraph.copyWith(color: AppColors.superGray),
        )
      ],
    );
  }

  Expanded buildFooter() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MoreDetails(onTap: configuration.onLinkTap),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/icons/pdf_icon.svg",
                height: 20,
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildImage(Size size) {
    return SizedBox(
      width: size.width,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: configuration.image.isEmpty
            ? Image.asset(
                "assets/image/thumbnail_placeholder.png",
                fit: BoxFit.cover,
              )
            : Image.network(configuration.image, fit: BoxFit.cover),
      ),
    );
  }
}
