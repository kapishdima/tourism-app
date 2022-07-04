import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

class CountryCard extends StatelessWidget {
  final int id;
  final String name;
  final String description;
  final String image;

  const CountryCard(
      {Key? key,
      required this.id,
      required this.name,
      required this.description,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Get.toNamed("/country");
      },
      child: Container(
        width: size.width * 0.4,
        height: 190,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(15),
            color: AppColors.dark),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: AppTheme.ligthTheme.textTheme.headline2!
                          .copyWith(color: AppColors.white),
                    ),
                    SvgPicture.asset("assets/icons/arrow-up-right.svg")
                  ],
                ),
                Text(description,
                    style: const TextStyle(
                      fontFamily: "NotoSansDisplay",
                      fontSize: 8,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ))
              ]),
        ),
      ),
    );
  }
}
