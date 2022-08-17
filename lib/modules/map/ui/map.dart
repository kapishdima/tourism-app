import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/modules/map/ui/filters/filter_button.dart';
import 'package:sea_of_wine_app/modules/map/ui/locations/cards/point_card.dart';
import 'package:sea_of_wine_app/modules/map/ui/map_provider.dart';
import 'package:sea_of_wine_app/modules/map/ui/pdf_button.dart';

class MapWidget extends StatelessWidget {
  final bool hasDraggableList;
  final bool isBlackSeaMap;

  const MapWidget({
    super.key,
    this.hasDraggableList = false,
    this.isBlackSeaMap = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double height = !hasDraggableList ? 440 : size.height;

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          MapProvider(
            isBlackSeaMap: isBlackSeaMap,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: PdfButton(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 30),
            child: Align(
              alignment: Alignment.topRight,
              child: FiltersButton(),
            ),
          ),
          PointCard(
            hasDraggableList: hasDraggableList,
          ),
        ],
      ),
    );
  }
}
