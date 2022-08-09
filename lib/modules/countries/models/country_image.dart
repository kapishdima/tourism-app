import 'package:json_annotation/json_annotation.dart';

part 'country_image.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryImage {
  final String url;

  CountryImage({required this.url});

  factory CountryImage.fromJson(Map<String, dynamic> json) =>
      _$CountryImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CountryImageToJson(this);

}
