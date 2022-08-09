import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';

class BlackSeaCard extends StatelessWidget {
  const BlackSeaCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/black-sea"),
      child: Container(
        width: size.width,
        height: 300,
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 28),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage('assets/images/black-sea-image.png'),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            color: AppColors.dark),
        child: buildContent(),
      ),
    );
  }

  Align buildContent() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Black sea wine route",
            style: AppTextsStyles.headline2Condensed
                .copyWith(color: AppColors.white),
          ),
          SvgPicture.asset("assets/icons/arrow-up-right.svg")
        ],
      ),
    );
  }
}
