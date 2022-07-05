import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/modes/way/way.dart';
import 'package:sea_of_wine_app/shared/cards/way_card.dart';

class WayList extends StatelessWidget {
  final List<Way> ways;
  const WayList({Key? key, required this.ways}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 60, left: 12),
        child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ways
                  .map(
                    (way) => WayCard(
                        image: "assets/images/way_image.png",
                        name: way.name,
                        description: way.text),
                  )
                  .toList(),
            )));
  }
}
