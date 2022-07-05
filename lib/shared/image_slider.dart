import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> images;

  const ImageSlider({Key? key, required this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: images.map((image) {
          return Row(
            children: [
              Container(
                width: 220,
                height: 325,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10)
            ],
          );
        }).toList(),
      ),
    );
  }
}
