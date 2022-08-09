import 'dart:typed_data';

import 'package:google_maps_flutter/google_maps_flutter.dart';

BitmapDescriptor createBitmapFromBytes(Uint8List bitmaps) {
  return BitmapDescriptor.fromBytes(bitmaps);
}
