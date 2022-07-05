import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: size.width,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(40, 56, 145, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 170),
              child: const Text("SHABO Wine Culture Center",
                  style: TextStyle(
                      fontFamily: "NotoSansDisplay_Condensed",
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/star_icon.svg", width: 55),
                const SizedBox(width: 16),
                const Text(
                  "4.5",
                  style: TextStyle(
                      fontFamily: "NotoSansDisplay",
                      fontSize: 55,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
