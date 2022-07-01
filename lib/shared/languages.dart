
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:sea_of_wine_app/settings/constans.dart';

class Languges extends StatelessWidget {
  const Languges({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 4),
            child: Text("En",
                style: TextStyle(
                    fontFamily: "NotoSansDisplay",
                    fontSize: 12,
                    color: AppColors.dark)),
          ),
          SvgPicture.asset("assets/icons/angle_down.svg")
        ],
      ),
    );
  }
}
