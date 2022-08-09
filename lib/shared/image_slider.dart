import 'package:flutter/material.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;

  const ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 325,
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.defaulPadding,
          top: AppSizes.defaulPadding,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: images
                .map(
                  (image) => Row(
                    children: [
                      buildItem(image),
                      const SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  SizedBox buildItem(String image) {
    return SizedBox(
      width: 220,
      height: 325,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
