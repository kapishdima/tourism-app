import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class PartnerCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const PartnerCard({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
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
                child: Image.asset(image, fit: BoxFit.contain,),
              ),
              SvgPicture.asset(
                'assets/icons/arrow-up-right.svg',
                color: AppColors.dark,
                width: 16,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(name,
                style: const TextStyle(
                    fontFamily: "NotoSansDisplay",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.dark)),
          )
        ],
      ),
    );
  }
}
