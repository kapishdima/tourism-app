import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/colors.dart';
import 'package:sea_of_wine_app/settings/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class PartnerCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;
  final String url;

  const PartnerCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () async {
        if (url.isEmpty) {
          return;
        }

        await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      },
      child: Container(
        width: size.width * 0.4,
        height: 236,
        decoration: BoxDecoration(
            color: AppColors.gray, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                url.isNotEmpty ? SvgPicture.asset(
                  'assets/icons/arrow-up-right.svg',
                  color: AppColors.dark,
                  width: 16,
                ) : Container()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(name,
                  style:
                      AppTextsStyles.paragraph.copyWith(color: AppColors.dark)),
            )
          ],
        ),
      ),
    );
  }
}
