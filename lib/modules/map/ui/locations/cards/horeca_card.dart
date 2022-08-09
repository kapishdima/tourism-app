import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class HorecaCard extends StatelessWidget {
  final Location location;
  
  final VoidCallback onClose;
  const HorecaCard({Key? key, required this.location, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: 300,
          constraints: const BoxConstraints(maxHeight: 180, minHeight: 180),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColors.white, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 90),
                child: FadeInImage(
                  placeholder:
                      const AssetImage("assets/images/thumb_placeholder.png"),
                  image: NetworkImage(location.entity.image.path),
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 20, top: 12, bottom: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle(),
                      buildEvents(),
                      buildContacts(),
                      Text(
                        "museum@shustov.com",
                        style: AppTextsStyles.label
                            .copyWith(color: AppColors.dark),
                      ),
                      Text(
                        "https://shustoff.3dprost",
                        style: AppTextsStyles.label
                            .copyWith(color: AppColors.dark),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildContacts() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Wrap(
        spacing: 2,
        children: [
          Text(
            "+38 048 740 08 99",
            style: AppTextsStyles.label.copyWith(color: AppColors.dark),
          ),
          Text(
            "+38 048 740 08 99",
            style: AppTextsStyles.label.copyWith(color: AppColors.dark),
          )
        ],
      ),
    );
  }

  RichText buildEvents() {
    return RichText(
      text: TextSpan(
        style: AppTextsStyles.label.copyWith(color: AppColors.dark),
        children: const [
          TextSpan(
              text: "Events: ", style: TextStyle(fontWeight: FontWeight.w500)),
          TextSpan(text: "Cognac tasting 17.05.22")
        ],
      ),
    );
  }

  Row buildTitle() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            location.entity.name,
            style: AppTextsStyles.cardTitle.copyWith(
              color: AppColors.dark,
            ),
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
