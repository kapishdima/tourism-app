import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialButton extends StatelessWidget {
  final String icon;
  final String url;

  const SocialButton({Key? key, required this.icon, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      child: IconButton(
        onPressed: () => launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
        icon: SvgPicture.asset(icon),
        padding: EdgeInsets.zero,
      ),
    );
  }
}
