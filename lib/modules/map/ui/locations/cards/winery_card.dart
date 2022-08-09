import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class WineryCard extends StatelessWidget {
  final Location location;
  final VoidCallback onClose;

  const WineryCard({Key? key, required this.location, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 300,
            height: 134,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [buildImage(), buildContent()],
            ),
          ),
        ));
  }

  Expanded buildContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    location.entity.name,
                    style:
                        AppTextsStyles.cardTitle.copyWith(color: AppColors.dark),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: onClose,
                  child: SvgPicture.asset(
                    "assets/icons/close_icon.svg",
                    width: 16,
                  ),
                )
              ],
            ),
            Row(children: [
              buildRating(),
              buildReviewsCount(),
            ]),
            Text(
              location.entity.description,
              style: const TextStyle(
                  fontFamily: "NotoSansDisplay",
                  fontSize: 10,
                  color: AppColors.dark),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildImage() {
    return SizedBox(
      width: 100,
      height: 134,
      child: location.entity.image.path == ""
          ? Image.asset("assets/images/thumb_placeholder.png")
          : FadeInImage.assetNetwork(
              placeholder: "assets/images/thumb_placeholder.png",
              image: location.entity.image.path,
              fit: BoxFit.cover,
            ),
    );
  }

  Padding buildReviewsCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "${location.entity.raviewsCount} rewiews",
            style: AppTextsStyles.label.copyWith(color: AppColors.dark),
          )
        ],
      ),
    );
  }

  Row buildRating() {
    return Row(
      children: List.generate(
        5,
        (index) {
          Color starColor =
              index < location.entity.rating ? AppColors.bordo : AppColors.gray;
          return SvgPicture.asset(
            "assets/icons/star_icon.svg",
            width: 14,
            height: 14,
            color: starColor,
          );
        },
      ),
    );
  }
}
