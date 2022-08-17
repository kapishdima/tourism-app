import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/shared/cards/partner_card.dart';

class Partner {
  final int id;
  final String name;
  final String image;
  final String url;

  Partner(
      {required this.id,
      required this.name,
      required this.image,
      required this.url});
}

class PartnersList extends StatefulWidget {
  const PartnersList({Key? key}) : super(key: key);

  @override
  State<PartnersList> createState() => _PartnersListState();
}

class _PartnersListState extends State<PartnersList> {
  final List<Partner> parters = [
    Partner(
        id: 0,
        name: "partner0",
        image: "assets/images/partners/eu.png",
        url: "https://european-union.europa.eu/"),
    Partner(
        id: 1,
        name: "partner1",
        image: "assets/images/partners/sea_of_wine.png",
        url: "https://seaofwine.travel/"),
    Partner(
        id: 2,
        name: "partner2",
        image: "assets/images/partners/black_sea.png",
        url: "https://blacksea-cbc.net/"),
    Partner(
      id: 3,
      name: "partner3",
      image: "assets/images/partners/icare.png",
      url: "https://icare.am/",
    ),
    Partner(
        id: 4,
        name: "partner4",
        image: "assets/images/partners/gcad.png",
        url: "http://www.gcad.ge/"),
    Partner(
        id: 5,
        name: "partner5",
        image: "assets/images/partners/onaft.png",
        url: "https://ontu.edu.ua/"),
    Partner(
      id: 6,
      name: "partner6",
      image: "assets/images/partners/auot.png",
      url:
          "http://www.agro.auth.gr/%CF%84%CE%BF%CE%BC%CE%B5%CE%B9%CF%82/%CE%B1%CE%B3%CF%81%CE%BF%CF%84%CE%B9%CE%BA%CE%B7%CF%82-%CE%BF%CE%B9%CE%BA%CE%BF%CE%BD%CE%BF%CE%BC%CE%B9%CE%B1%CF%82",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 15,
      spacing: 10,
      children: parters
          .map(
            (partner) => PartnerCard(
              id: partner.id,
              name: partner.name,
              image: partner.image,
              url: partner.url,
            ),
          )
          .toList(),
    );
  }
}
