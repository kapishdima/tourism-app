import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class AttractionCard extends StatelessWidget {
  final Location location;
  final VoidCallback onClose;
  const AttractionCard({Key? key, required this.location, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 300,
          constraints: const BoxConstraints(maxHeight: 200),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTitle(),
              const SizedBox(height: AppSizes.defaulPadding / 2),
              buildAddress(),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/planet_icon.svg"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "http://shabo.ua/",
                        style: AppTextsStyles.paragraph
                            .copyWith(color: AppColors.superGray),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset("assets/icons/contacts_icon.svg"),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        "+38 067 222 77 70",
                        style: AppTextsStyles.paragraph
                            .copyWith(color: AppColors.superGray),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildAddress() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset("assets/icons/map_icon.svg"),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              location.address,
              style:
                  AppTextsStyles.paragraph.copyWith(color: AppColors.superGray),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  Row buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            location.entity.name,
            style: AppTextsStyles.headline3Condensed
                .copyWith(color: AppColors.bordo),
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
    );
  }
}
