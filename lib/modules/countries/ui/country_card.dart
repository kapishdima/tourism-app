import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/modules/countries/store/countries_store.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:sea_of_wine_app/setup.dart';

abstract class CountryCard extends StatelessWidget {
  const CountryCard({Key? key}) : super(key: key);

  factory CountryCard.loading() => const CountryCardLoading();
  factory CountryCard.loaded({
    required int id,
    required String name,
    required String regions,
    required String image,
  }) =>
      CountryCardLoaded(
        id: id,
        name: name,
        regions: regions,
        image: image,
      );
}

class CountryCardLoading extends CountryCard {
  const CountryCardLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.4,
      height: 190,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: AppColors.gray),
    );
  }
}

class CountryCardLoaded extends CountryCard {
  final int id;
  final String name;
  final String regions;
  final String image;

  final CountriesStore countriesStore =
      appStoresContainer.get<CountriesStore>();

  CountryCardLoaded(
      {Key? key,
      required this.id,
      required this.name,
      required this.regions,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        countriesStore.setCurrentCountry(id);
        Navigator.pushNamed(context, "/country");
      },
      child: Container(
        width: size.width * 0.41,
        height: 190,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            buildCountryImage(),
            buildGradient(),
            buildCountryInfo(),
          ],
        ),
      ),
    );
  }

  Positioned buildGradient() {
    return const Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      height: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color.fromRGBO(0, 0, 0, 0.05),
              Color.fromRGBO(0, 0, 0, 0.64),
            ],
            stops: [0.0, 1.0],
          ),
        ),
      ),
    );
  }

  Positioned buildCountryImage() {
    return Positioned.fill(
        child: FadeInImage(
      placeholder: const AssetImage("assets/images/thumb_placeholder.png"),
      fadeInCurve: Curves.easeIn,
      fadeInDuration: const Duration(milliseconds: 100),
      image: NetworkImage(image),
      fit: BoxFit.cover,
    ));
  }

  Positioned buildCountryInfo() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: AppTextsStyles.headline2Condensed
                      .copyWith(color: AppColors.white),
                ),
                SvgPicture.asset("assets/icons/arrow-up-right.svg")
              ],
            ),
            Text(
              regions,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: "NotoSansDisplay",
                fontSize: 8,
                fontWeight: FontWeight.w500,
                color: AppColors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
