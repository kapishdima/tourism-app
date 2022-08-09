import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/app_localization.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery_review.dart';
import 'package:sea_of_wine_app/modules/wineries/store/wineries_store.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/cards/review_full_card.dart';

class ReviewsScreen extends StatelessWidget {
  final WineriesStore wineriesStore = appStoresContainer.get<WineriesStore>();

  ReviewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(AppLocalization.of(context).t("reviews_screen_title"),
                style: AppTextsStyles.headline2.copyWith(color: AppColors.dark))
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset("assets/icons/close_icon.svg")),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 38, right: 30),
        child: ListView.separated(
          padding: const EdgeInsets.only(top: 60),
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 30),
          itemCount: wineriesStore.winery!.reviews.length,
          itemBuilder: (context, index) {
            final WineryReview review = wineriesStore.winery!.reviews[index];
            return ReviewFullCard(
              authorImage: "http://localhost/storage/uploads/fixtures/karsten-wurth-49aQgxkOrO4-unsplash.jpg",
              authorName: "User $index",
              date: review.date,
              rating: review.rating,
              text: review.text,
            );
          },
        ),
      ),
    );
  }
}
