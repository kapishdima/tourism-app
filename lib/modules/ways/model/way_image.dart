import 'package:json_annotation/json_annotation.dart';

part 'way_image.g.dart';

@JsonSerializable(explicitToJson: true)
class WayImage {
  @JsonKey(name: "url")
  final String url;

  WayImage({required this.url});

  factory WayImage.fromJson(Map<String, dynamic> json) =>
      _$WayImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$WayImageToJson(this);

  
}
