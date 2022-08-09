import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';

import 'package:sea_of_wine_app/modules/map/ui/map.dart';
import 'package:sea_of_wine_app/modules/ways/ui/way_list.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery_review.dart';
import 'package:sea_of_wine_app/modules/wineries/ui/additional_info_list.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/buttons/show_all_reviews_button.dart';
import 'package:sea_of_wine_app/shared/cards/rating_card.dart';
import 'package:sea_of_wine_app/shared/cards/review_card.dart';
import 'package:sea_of_wine_app/shared/cards/social_login_card.dart';
import 'package:sea_of_wine_app/shared/grid_container.dart';
import 'package:sea_of_wine_app/shared/html_text.dart';
import 'package:sea_of_wine_app/shared/image_slider.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/skeleton_loading_screen.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class WineryScreenConfiguration {
  final String name;
  final String text;
  final String image;
  final List<String> gallery;
  final double rating;
  final int reviewsCount;
  final List<WineryReview> reviews;
  final Map<String, String?> additionalInfo;
  final Location location;

  WineryScreenConfiguration({
    required this.name,
    required this.text,
    required this.image,
    required this.gallery,
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
    required this.additionalInfo,
    required this.location,
  });
}

abstract class WineryScreenView extends StatelessWidget {
  const WineryScreenView({Key? key}) : super(key: key);

  factory WineryScreenView.loaded(WineryScreenConfiguration configuration) =>
      WineryScreenViewLoaded(configuration: configuration);
  factory WineryScreenView.loading() => const WineryScreenViewLoading();
}

class WineryScreenViewLoading extends WineryScreenView {
  const WineryScreenViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SkeletonLoadingScreen();
  }
}

class WineryScreenViewLoaded extends WineryScreenView {
  final WineryScreenConfiguration configuration;

  const WineryScreenViewLoaded({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
      children: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            const SizedBox(height: AppSizes.defaulPadding * 2),
            buildText(),
            buildSlider(),
            const SizedBox(height: AppSizes.defaulPadding * 2),
            AdditionalInfoList(additionalInfo: configuration.additionalInfo),
            const MapWidget(),
            const SizedBox(height: AppSizes.defaulPadding),
            const GridContainer(
              child: WaysList(
                type: WaysListTypes.horizontal,
              ),
            ),
            buildRatingCard(),
            const SocialLoginCard(),
            const SizedBox(height: AppSizes.defaulPadding),
            buildReviewsList(),
            const SizedBox(height: 15),
            buildShowAllReviesButton()
          ],
        ),
      ),
    );
  }

  Padding buildRatingCard() {
    return Padding(
      padding:
          const EdgeInsets.only(top: AppSizes.defaulPadding * 2, bottom: 10),
      child: RatingCard(
        name: configuration.name,
        rating: configuration.rating,
      ),
    );
  }

  Widget buildSlider() {
    if (configuration.gallery.isEmpty) {
      return Container();
    }
    return ImageSlider(images: configuration.gallery);
  }

  GridContainer buildText() {
    return GridContainer(
      child: HtmlText(
        text: configuration.text,
        style: const TextStyle(color: AppColors.dark),
      ),
    );
  }

  Widget buildReviewsList() {
    if (configuration.reviews.isEmpty) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: SizedBox(
        height: 216,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(width: 10),
            itemBuilder: (BuildContext context, int index) {
              final WineryReview review = configuration.reviews[index];
              return ReviewCard(
                authorName: "User $index",
                authorImage:
                    "http://localhost/storage/uploads/fixtures/karsten-wurth-49aQgxkOrO4-unsplash.jpg",
                text: review.text,
                rating: review.rating,
                date: review.date,
              );
            },
            itemCount: configuration.reviews.length),
      ),
    );
  }

  Widget buildShowAllReviesButton() {
    if (configuration.reviews.isEmpty) {
      return Container();
    }

    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: ShowAllReviews(),
    );
  }

  SizedBox buildHeader(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          SizedBox(
            width: size.width,
            height: double.infinity,
            child: configuration.image.isEmpty
                ? Image.asset("assets/images/thumb_placeholder.png",
                    fit: BoxFit.cover)
                : FadeInImage(
                    placeholder:
                        const AssetImage("assets/images/thumb_placeholder.png"),
                    image: NetworkImage(configuration.image),
                    fit: BoxFit.cover,
                  ),
          ),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Color.fromRGBO(111, 111, 111, 0),
                    Color.fromRGBO(0, 0, 0, 0.48),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
          ),
          buildHeadInfo(context)
        ],
      ),
    );
  }

  Padding buildHeadInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            configuration.name,
            style: AppTextsStyles.headline2.copyWith(color: AppColors.white),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/star_icon.svg"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(configuration.rating.toString(),
                    style: AppTextsStyles.headline2
                        .copyWith(color: AppColors.white)),
              ),
              Text(
                  "(${configuration.reviewsCount} ${AppLocalization.of(context).t('reviews')})",
                  style:
                      AppTextsStyles.paragraph.copyWith(color: AppColors.white))
            ],
          )
        ],
      ),
    );
  }
}
