import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';

class WayCard extends StatelessWidget {
  final String name, image, description;

  const WayCard({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
          width: size.width * 0.55,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          decoration: const BoxDecoration(
              border: Border(
                  right: BorderSide(
                      color: AppColors.gray,
                      width: 1,
                      style: BorderStyle.solid))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WayImage(image: image),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.ligthTheme.textTheme.headline3!
                          .copyWith(color: AppColors.dark))),
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text(
                  description,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: AppTheme.ligthTheme.textTheme.bodyText1!
                      .copyWith(color: AppColors.superGray),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Text("More details",
                        style: TextStyle(
                            fontFamily: "NotoSansDisplay",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline)),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset("assets/icons/pdf_icon.svg"))
                ],
              )
            ],
          )),
    );
  }
}

class WayImage extends StatelessWidget {
  final String image;
  const WayImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle, borderRadius: BorderRadius.circular(5)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
