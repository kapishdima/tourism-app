import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/shared/cards/black_sea_card.dart';
import 'package:sea_of_wine_app/shared/cards/counrty_card.dart';
import 'package:sea_of_wine_app/shared/cards/partner_card.dart';
import 'package:sea_of_wine_app/shared/layouts/home_layout.dart';
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

class Partner {
  final int id;
  final String name;
  final String image;

  Partner({required this.id, required this.name, required this.image});
}

class HomeScreen extends StatefulWidget {
  final List<Country> countries = [
    Country(
        id: 0,
        name: "Armenia",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/countries/country-image-2.png"),
    Country(
        id: 1,
        name: "Georgia",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/countries/country-image-4.png"),
    Country(
        id: 2,
        name: "Ukraine",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/countries/country-image-1.png"),
    Country(
        id: 3,
        name: "Greece",
        description: "Kentriki, Makedonia, Anatoliki, Makedonia, Thraki",
        image: "assets/images/countries/country-image-3.png"),
  ];

  final List<Partner> parters = [
    Partner(
        id: 0,
        name: "Project funded by European Union",
        image: "assets/images/partners/eu.png"),
    Partner(
        id: 1,
        name: "The sea of wine",
        image: "assets/images/partners/sea_of_wine.png"),
    Partner(
        id: 2,
        name: "Black sea crossborder cooperation",
        image: "assets/images/partners/black_sea.png"),
    Partner(
        id: 3,
        name:
            "International Center for Agribusiness Research and Education Foundation",
        image: "assets/images/partners/icare.png"),
    Partner(
        id: 4,
        name: "Georgian Center for Agribusiness Development",
        image: "assets/images/partners/gcad.png"),
    Partner(
        id: 5,
        name: "Odessa National Academy of Food Technologies",
        image: "assets/images/partners/onaft.png"),
    Partner(
        id: 6,
        name: "Aristotle University of Thessaloniki ",
        image: "assets/images/partners/auot.png"),
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
        children: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 40, bottom: 15), child: BlackSeaCard()),
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
          ),
          Wrap(
            runSpacing: 15,
            spacing: 10,
            children: widget.parters
                .map((partner) => PartnerCard(
                    id: partner.id, name: partner.name, image: partner.image))
                .toList(),
          )
        ],
      ),
    ));
  }
}
