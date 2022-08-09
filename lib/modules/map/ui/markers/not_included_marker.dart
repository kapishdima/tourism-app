import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotIncludedMarker extends StatelessWidget {
  final String icon;
  final GlobalKey globalKey = GlobalKey();

  NotIncludedMarker({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: SizedBox(
        width: 46,
        height: 46,
        child: SvgPicture.asset(icon),
      ),
    );
  }
}
