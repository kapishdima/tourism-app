import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


Future<BitmapDescriptor> getMarkerIcon(
      {required String path, double width = 20, double height = 20 }) async {
    // Read SVG file as String
    String svgString =
        await rootBundle.loadString(path);
    // Create DrawableRoot from SVG String
    DrawableRoot svgDrawableRoot = await svg.fromSvgString(svgString, path);

    // Convert to ui.Picture
    ui.Picture picture = svgDrawableRoot.toPicture(size: Size(width, height));

    // Convert to ui.Image. toImage() takes width and height as parameters
    // you need to find the best size to suit your needs and take into account the
    // screen DPI
    ui.Image image = await picture.toImage(width.toInt(), height.toInt());
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
  }