import 'package:json_annotation/json_annotation.dart';

part 'winery_image.g.dart';

@JsonSerializable(explicitToJson: true)
class WineryImage {
  String url;

  WineryImage({required this.url});

  factory WineryImage.fromJson(Map<String, dynamic> json) =>
      _$WineryImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WineryImageToJson(this);
}
