import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sea_of_wine_app/modules/map/model/location/location_types.dart';
import 'package:sea_of_wine_app/modules/map/store/locations_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';
import 'package:sea_of_wine_app/shared/more_details.dart';

final Map<String, String> countriesIcons = {
  "Armenia": "assets/icons/countries/armenia.svg",
  "Georgia": "assets/icons/countries/georgia.svg",
  "Greece": "assets/icons/countries/greece.svg",
  "Ukraine": "assets/icons/countries/ukraine.svg",
};

class LocationCardConfiguration {
  final int id;
  final String name;
  final String image;
  final LocationTypes type;
  final double rating;
  final int reviewsCount;
  final int order;
  final bool isStart;
  final bool isFinish;
  final bool shouldRenderCountryName;
  final String countryName;
  final VoidCallback onCardTap;
  final VoidCallback? onLinkTap;
  final bool isSelected;

  LocationCardConfiguration(
      {required this.id,
      required this.name,
      required this.image,
      required this.type,
      required this.rating,
      required this.reviewsCount,
      required this.order,
      required this.isStart,
      required this.isFinish,
      required this.onCardTap,
      required this.isSelected,
      this.shouldRenderCountryName = false,
      this.countryName = "",
      this.onLinkTap});
}

class LocationCard extends StatelessWidget {
  final LocationCardConfiguration configuration;
  final LocationsStore locationsStore =
      appStoresContainer.get<LocationsStore>();

  LocationCard({Key? key, required this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = 188;
    double lineDecoratorHeight = 55;

    return GestureDetector(
      onTap: configuration.onCardTap,
      child: SizedBox(
        width: cardWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            buildLineDecorator(lineDecoratorHeight, cardWidth),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildImage(size),
                    buildHeadInfo(),
                    const SizedBox(height: 10),
                    if (configuration.type == LocationTypes.winery)
                      MoreDetails(
                        onTap: configuration.onLinkTap ?? () => {},
                      )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildLineDecorator(double lineDecoratorHeight, double cardWidth) {
    return SizedBox(
      height: lineDecoratorHeight,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: cardWidth - 6,
              height: 1,
              color: AppColors.dark,
              margin: const EdgeInsets.only(top: 18),
            ),
          ),
          buildIconDecorator(),
        ],
      ),
    );
  }

  Widget buildIconDecorator() {
    if (configuration.isStart) {
      return Positioned(
        top: 0,
        left: 0,
        child: SvgPicture.asset(
          configuration.shouldRenderCountryName
              ? countriesIcons[configuration.countryName]!
              : 'assets/icons/locations/start_icon.svg',
          width: 40,
          height: 40,
        ),
      );
    }

    if (configuration.isFinish) {
      return Positioned(
        top: -3,
        left: -3,
        child: SvgPicture.asset(
          'assets/icons/locations/finish_icon.svg',
          width: 40,
          height: 40,
        ),
      );
    }

    return Positioned(
      top: 5,
      left: 0,
      child: Container(
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.dark,
        ),
        child: Center(
          child: Text(
            configuration.order.toString(),
            style: AppTextsStyles.cardTitle
                .copyWith(color: AppColors.white, fontStyle: FontStyle.normal),
          ),
        ),
      ),
    );
  }

  SizedBox buildImage(Size size) {
    return SizedBox(
      width: size.width * 0.55,
      height: 100,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image(
          image: NetworkImage(configuration.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Column buildHeadInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            configuration.name,
            style: AppTextsStyles.headline3Condensed.copyWith(
                color: configuration.isSelected
                    ? AppColors.bordo
                    : AppColors.dark),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        configuration.type == LocationTypes.winery ? buildRating() : Container()
      ],
    );
  }

  Column buildMoreDetails() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.bottomLeft,
          child: MoreDetails(
            onTap: configuration.onLinkTap ?? () => {},
          ),
        ),
      ],
    );
  }

  Row buildRating() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => SvgPicture.asset(
            "assets/icons/star_icon.svg",
            width: 12,
            height: 12,
            color:
                index < configuration.rating ? AppColors.bordo : AppColors.gray,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          "${configuration.reviewsCount} reviews",
          style: AppTextsStyles.label,
        )
      ],
    );
  }
}
