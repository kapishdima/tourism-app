import 'package:flutter/material.dart';

import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class LocationMarker extends StatefulWidget {
  final Location location;

  const LocationMarker({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationMarker> createState() => _LocationMarkerState();
}

class _LocationMarkerState extends State<LocationMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.dark, width: 2),
            shape: BoxShape.circle),
        child: Center(
            child: Text(
          widget.location.order.toString(),
          style: const TextStyle(
              fontFamily: "NotoSansDisplay",
              fontWeight: FontWeight.normal,
              fontSize: 12,
              color: AppColors.dark),
        )));
  }
}
