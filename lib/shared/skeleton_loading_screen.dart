import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/shared/layouts/layout.dart';

class SkeletonLoadingScreen extends StatelessWidget {
  const SkeletonLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Layout(
        children: Column(
      children: [
        buildHeaderRect(),
        buildBodyRect(),
      ],
    ));
  }

  Shimmer buildBodyRect() {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.shimmerColor,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Wrap(
          spacing: 5,
          runSpacing: 10,
          children: List.generate(
              8, (index) => buildTextRect(AppColors.gray, height: 10)),
        ),
      ),
    );
  }

  SizedBox buildHeaderRect() {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          Shimmer.fromColors(
              baseColor: AppColors.gray,
              highlightColor: AppColors.shimmerColor,
              child: Positioned.fill(
                child: Container(
                  color: AppColors.gray,
                ),
              )),
          Positioned.fill(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildTitleRect(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildTextRect(AppColors.superGray.withOpacity(0.1))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTitleRect() {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.superGray.withOpacity(0.1),
      ),
    );
  }

  Widget buildTextRect(Color color, {double height = 20}) {
    return Container(
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
    );
  }
}
