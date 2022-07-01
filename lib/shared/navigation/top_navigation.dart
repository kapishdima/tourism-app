import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class TopNavigation extends StatelessWidget {
  const TopNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      actions: [
        Row(
          children: const [
            Text("En", style: TextStyle(fontFamily: "NotoSansDisplay", fontSize: 12, color: AppColors.dark))
          ],
        )
      ],
    );
  }
}
