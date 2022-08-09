import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class GridContainer extends StatelessWidget {
  final Widget child;
  const GridContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaulPadding), child: child);
  }
}
