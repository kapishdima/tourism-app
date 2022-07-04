import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/shared/cards/black_sea_card.dart';
import 'package:sea_of_wine_app/shared/cards/counrty_card.dart';
import 'package:sea_of_wine_app/shared/layout.dart';
import 'package:sea_of_wine_app/shared/texts/big_headline.dart';
import 'package:sea_of_wine_app/shared/texts/paragraph_text.dart';

class Country {
  final int id;
  final String name;
  final String description;
  final String image;

  Country(
      {required this.id,
      required this.name,
      required this.description,
      required this.image});
}

class HomeScreen extends StatefulWidget {
  final List<Country> countries = [
    Country(
        id: 0,
        name: "Armenia",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/country-image-2.png"),
    Country(
        id: 1,
        name: "Georgia",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/country-image-4.png"),
    Country(
        id: 2,
        name: "Ukraine",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/country-image-1.png"),
    Country(
        id: 3,
        name: "Greece",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/country-image-3.png"),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Layout(
        children: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        width: size.width - 60,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(bottom: 15), child: BlackSeaCard()),
            Wrap(
              spacing: 10,
              runSpacing: 15,
              children: widget.countries
                  .map((country) => CountryCard(
                      id: country.id,
                      name: country.name,
                      description: country.description,
                      image: country.image))
                  .toList(),
            ),
            const Padding(
                padding: EdgeInsets.only(top: 60, bottom: 20),
                child: BigHeadline(
                    text: "This 26-month project is jointly implemented by:")),
            const Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: ParagraphText(
                  text:
                      "The project will take place within the framework of the Joint Operational Program for the Black Sea Basin for 2014-2020. European Neighborhood Instrument in close cooperation with the Joint Technical Secretariat. "),
            )
          ],
        )),
      ),
    ));
  }
}
