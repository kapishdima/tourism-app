import 'package:flutter/material.dart';

Map<String, double> getSize(BuildContext context) {
  // toPicture() and toImage() don't seem to be pixel ratio aware, so we calculate the actual sizes here
  MediaQueryData queryData = MediaQuery.of(context);
  double devicePixelRatio = queryData.devicePixelRatio;
  double width = 30 * devicePixelRatio; // where 32 is your SVG's original width
  double height = 30 * devicePixelRatio; // same thing

  return {"width": width, "height": height};
}
