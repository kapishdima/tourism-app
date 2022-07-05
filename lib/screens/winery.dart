import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';
import 'package:sea_of_wine_app/shared/cards/rating_card.dart';
import 'package:sea_of_wine_app/shared/image_slider.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';
import 'package:sea_of_wine_app/shared/lists/additional_info_list.dart';

class WineryScreen extends StatelessWidget {
  final Map<int, String> additionalInfo = [
    "Without first calling all year around",
    "Without first calling all year around",
    "Ukrainian, English, Russian",
    "Odessa",
    "Large",
    "Organic, Natural, Biodynamic",
    "Chardonnay, Merlot, Cabernet-Sauvignon",
    "Wine and Urban Life, Wine and Art",
    "Tours with meals/snack",
    "Credit Card & Cash",
    "At the winery"
  ].asMap();
  WineryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Layout(
        children: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 60),
            child: Wrap(
              runSpacing: 10,
              children: [
                Text(
                  "Ukraine that unites an operating high-tech enterprise, ancient wine cellars, a tasting room, expositions of modern sculptural and architectural art, as well as a unique Museum of Wine and Winemaking.",
                  style: AppTheme.ligthTheme.textTheme.bodyText1!
                      .copyWith(color: AppColors.dark),
                ),
                Text(
                  "On its basis, events are successfully held aimed at increasing the culture of consumption of noble drinks, popularizing a healthy lifestyle among the younger generation and strengthening the Ukrainian family.",
                  style: AppTheme.ligthTheme.textTheme.bodyText1!
                      .copyWith(color: AppColors.dark),
                ),
              ],
            ),
          ),
          const Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: ImageSlider(images: [
                "assets/images/image-slide.png",
                "assets/images/image-slide.png",
                "assets/images/image-slide.png",
              ])),
          AdditionalInfoList(additionalValues: additionalInfo),
          const Padding(padding: EdgeInsets.only(
            top: 60,
            bottom: 30
          ), child: RatingCard(),)
        ],
      ),
    )));
  }

  Stack buildHeader() {
    return Stack(
      children: [
        Container(
          height: 330,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/winery-image.png"),
                  fit: BoxFit.cover)),
        ),
        Positioned.fill(
          child: Container(
            height: 330,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                  Color.fromRGBO(111, 111, 111, 0),
                  Color.fromRGBO(0, 0, 0, 0.48),
                ],
                    stops: [
                  0.0,
                  1.0
                ])),
            child: buildHeadInfo(),
          ),
        )
      ],
    );
  }

  Padding buildHeadInfo() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("SHABO Wine Culture Center",
              style: AppTheme.ligthTheme.textTheme.headline2!
                  .copyWith(color: AppColors.white)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/star_icon.svg"),
              const SizedBox(width: 6),
              const Text("4.5",
                  style: TextStyle(
                      fontFamily: "NotoSansDisplay",
                      fontSize: 23,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white)),
              const SizedBox(width: 6),
              const Text(
                "(93 rewiews)",
                style: TextStyle(
                    fontFamily: "NotoSansDiaply",
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
