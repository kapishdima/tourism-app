import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/shared/html_text.dart';
import 'package:sea_of_wine_app/shared/more_details.dart';

class WayCardVerticalConfiguration {
  final String name;
  final String thumbnail;
  final String description;
  final void Function() onCardTap;
  final void Function() onLinkTap;
  final bool isSelected;

  WayCardVerticalConfiguration(
      {required this.name,
      required this.thumbnail,
      required this.description,
      required this.onCardTap,
      required this.onLinkTap,
      required this.isSelected});
}

abstract class WayCardVertical extends StatelessWidget {
  const WayCardVertical({Key? key}) : super(key: key);
  factory WayCardVertical.loaded(
          {required WayCardVerticalConfiguration configuration}) =>
      WayCardVerticalLoaded(configuration: configuration);
  factory WayCardVertical.loading() => const WayCardVerticalLoading();
}

class WayCardVerticalLoaded extends WayCardVertical {
  final WayCardVerticalConfiguration configuration;

  const WayCardVerticalLoaded({Key? key, required this.configuration})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final TextStyle selectedCardStyle =
        AppTextsStyles.cardText.copyWith(color: AppColors.bordo);
    final TextStyle defaultCardStyle =
        AppTextsStyles.cardText.copyWith(color: AppColors.dark);

    return GestureDetector(
      onTap: configuration.onCardTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(size),
          const SizedBox(
            height: 15,
          ),
          buildContent(selectedCardStyle, defaultCardStyle)
        ],
      ),
    );
  }

  Wrap buildContent(TextStyle selectedCardStyle, TextStyle defaultCardStyle) {
    return Wrap(
      runSpacing: 10,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            configuration.name,
            style:
                configuration.isSelected ? selectedCardStyle : defaultCardStyle,
          ),
        ),
        HtmlText(
          text: configuration.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: AppTextsStyles.paragraph.copyWith(color: AppColors.superGray),
        ),
        buildFooter()
      ],
    );
  }

  Row buildFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MoreDetails(onTap: configuration.onLinkTap),
        SvgPicture.asset("assets/icons/pdf_icon.svg")
      ],
    );
  }

  SizedBox buildImage(Size size) {
    return SizedBox(
      width: size.width,
      height: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: configuration.thumbnail.isEmpty
            ? Image.asset(
                "assets/image/thumbnail_placeholder.png",
                fit: BoxFit.cover,
              )
            : Image.network(configuration.thumbnail, fit: BoxFit.cover),
      ),
    );
  }
}

class WayCardVerticalLoading extends WayCardVertical {
  const WayCardVerticalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SizedBox(
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
          const SizedBox(
            height: 5,
          ),
          buildTextRect(size),
        ],
      ),
    );
  }

  Container buildImageRect(Size size) {
    return Container(
      width: size.width,
      height: 160,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.gray),
    );
  }

  Container buildTitleRect(Size size) {
    return Container(
      width: size.width,
      height: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.gray),
    );
  }

  Container buildTextRect(Size size) {
    return Container(
      width: size.width,
      height: 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.gray),
    );
  }
}
