import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/shared/more_details.dart';
import 'package:sea_of_wine_app/shared/rating_row.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

abstract class WineryCard extends StatelessWidget {
  const WineryCard({Key? key}) : super(key: key);

  factory WineryCard.loading() => const WineryCardLoading();
  factory WineryCard.loaded(WineryCardLoadedConfiguration configuration) =>
      WineryCardLoaded(configuration: configuration);
}

class WineryCardLoadedConfiguration {
  final int id;
  final String image;
  final String name;
  final double rating;
  final int reviewsCount;
  final bool isSelected;
  final void Function() onCardTap;
  final void Function() onLinkTap;

  WineryCardLoadedConfiguration({
    required this.id,
    required this.image,
    required this.name,
    required this.isSelected,
    required this.rating,
    required this.reviewsCount,
    required this.onCardTap,
    required this.onLinkTap,
  });
}

class WineryCardLoaded extends WineryCard {
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();
  final WineryCardLoadedConfiguration configuration;

  WineryCardLoaded({Key? key, required this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: configuration.onCardTap,
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildWineryImage(size),
            buildWineryName(),
            buildRatingRow(context),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              MoreDetails(onTap: configuration.onLinkTap),
            ])
          ],
        ),
      ),
    );
  }

  Padding buildWineryName() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        configuration.name,
        style: AppTextsStyles.cardText.copyWith(
          color: configuration.isSelected ? AppColors.bordo : AppColors.dark,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Row buildRatingRow(BuildContext context) {
    return Row(
      children: [
        RatingRow(
          ratingCount: configuration.rating,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          "${configuration.reviewsCount} ${AppLocalization.of(context).t('reviews')}",
          style: AppTextsStyles.label.copyWith(color: AppColors.dark),
        )
      ],
    );
  }

  SizedBox buildWineryImage(Size size) {
    return SizedBox(
      width: size.width,
      height: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: configuration.image.isEmpty
            ? Image.asset(
                "assets/images/thumb_placeholder.png",
                fit: BoxFit.cover,
              )
            : Image.network(
                configuration.image,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class WineryCardLoading extends WineryCard {
  const WineryCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.shimmerColor,
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildImageRect(size),
            const SizedBox(
              height: 10,
            ),
            buildTitleRect(size),
            const SizedBox(
              height: 20,
            ),
            buildTextRect(size),
            const SizedBox(
              height: 5,
            ),
            buildTextRect(size),
          ],
        ),
      ),
    );
  }

  Container buildTitleRect(Size size) {
    return Container(
      width: size.width,
      height: 30,
      decoration: BoxDecoration(
          color: AppColors.gray, borderRadius: BorderRadius.circular(10)),
    );
  }

  Container buildTextRect(Size size) {
    return Container(
      width: size.width,
      height: 10,
      decoration: BoxDecoration(
          color: AppColors.gray, borderRadius: BorderRadius.circular(40)),
    );
  }

  Container buildImageRect(Size size) {
    return Container(
      width: size.width,
      height: 160,
      decoration: BoxDecoration(
          color: AppColors.gray, borderRadius: BorderRadius.circular(10)),
    );
  }
}
