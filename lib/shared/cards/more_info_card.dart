import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';
import 'package:sea_of_wine_app/settings/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class MoreInfoCard extends StatelessWidget {
  final String name;
  final String url;
  final String image;

  const MoreInfoCard({
    Key? key,
    required this.name,
    required this.url,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      child: Container(
        width: size.width,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: AppTheme.ligthTheme.textTheme.headline2!
                      .copyWith(color: AppColors.white),
                ),
                SvgPicture.asset("assets/icons/arrow-up-right.svg")
              ],
            )
          ],
        ),
      ),
    );
  }
}
