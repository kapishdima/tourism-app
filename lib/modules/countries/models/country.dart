import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modules/countries/models/country_region.dart';
import 'package:sea_of_wine_app/modules/countries/models/country_image.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

part 'country.g.dart';

final Map<String, String> countriesIcons = {
  "am": "assets/icons/countries/armenia.svg",
  "ge": "assets/icons/countries/georgia.svg",
  "gr": "assets/icons/countries/greece.svg",
  "ua": "assets/icons/countries/ukraine.svg",
};

@JsonSerializable(explicitToJson: true)
class Country {
  final int id;
  final String code;
  final String name;

  @JsonKey(name: "first_block_title")
  final String description;

  @JsonKey(name: "first_block_text")
  final String text;

  @JsonKey(name: "thumbnail", fromJson: _imageWithDefault)
  final CountryImage thumbnail;

  @JsonKey(name: "gallery", fromJson: _imagesWithDefault)
  final List<CountryImage> gallery;

  @JsonKey(name: "regions")
  final List<CountryRegion> regions;

  Country({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
    required this.code,
    required this.text,
    required this.gallery,
    required this.regions,
  });

  String get icon {
    return countriesIcons[code] ?? "";
  }

  static CountryImage _imageWithDefault(Map<String, dynamic>? image) {
    if (image == null) {
      return CountryImage(url: "");
    }

    return CountryImage(
        url: image["url"].toString().contains("storage")
            ? "${ApiSettings.baseUrl}${image["url"]}"
            : image["url"]);
  }

  static List<CountryImage> _imagesWithDefault(List<dynamic>? images) {
    return images?.map(((image) {
          return _imageWithDefault(image);
        })).toList() ??
        [];
  }

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
