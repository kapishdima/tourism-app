import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';

import 'package:sea_of_wine_app/settings/colors.dart';

class OrderedMarker extends StatefulWidget {
  final Location location;

  const OrderedMarker({Key? key, required this.location}) : super(key: key);

  @override
  State<OrderedMarker> createState() => _OrderedMarkerState();
}

class _OrderedMarkerState extends State<OrderedMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.dark, width: 2),
            shape: BoxShape.circle),
        child: Center(
            child: Text(
          widget.location.order.toString(),
          style: const TextStyle(
              fontFamily: "NotoSansDisplay",
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: AppColors.dark),
        )));
  }
}
