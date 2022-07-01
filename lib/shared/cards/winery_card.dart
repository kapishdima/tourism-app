import 'package:flutter/widgets.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

class WineryCard extends StatelessWidget {
  final Location? location;
  const WineryCard({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: 300,
          height: 134,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: AppColors.white),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 100,
                height: 134,
                child: location == null || location?.entity.image.path == ""
                    ? Image.asset("assets/images/thumb_placeholder.png")
                    : FadeInImage.assetNetwork(
                        placeholder: "assets/images/thumb_placeholder.png",
                        image: location!.entity.image.path, fit: BoxFit.cover,),
              ),
              Expanded(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Column(
                  children: [
                    Text(
                      location?.entity.name ?? "",
                      style: const TextStyle(
                          fontFamily: "NotoSansDisplay",
                          fontStyle: FontStyle.italic,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.dark),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text("93 rewiews",
                              style: TextStyle(
                                  fontFamily: "NotoSansDisplay",
                                  fontSize: 12,
                                  color: AppColors.dark))
                        ],
                      ),
                    ),
                    Text(
                      location?.entity.description ?? "",
                      style: const TextStyle(
                          fontFamily: "NotoSansDisplay",
                          fontSize: 10,
                          color: AppColors.dark),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ))
            ],
          ),
        ));
  }

  
}
