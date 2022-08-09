import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActiveMarker extends StatelessWidget {
  
  final GlobalKey globalKey = GlobalKey();

  ActiveMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: globalKey,
      child: SizedBox(
        width: 46,
        height: 46,
        child: SvgPicture.asset("assets/icons/locations/active_icon.svg"),
      ),
    );
  }
}
