import 'package:json_annotation/json_annotation.dart';

part 'location_image.g.dart';

@JsonSerializable(explicitToJson: true)
class LocationImage {
  @JsonKey(name: "compressed_path")
  final String path;

  LocationImage({required this.path});

  factory LocationImage.fromJson(Map<String, dynamic> json) =>
      _$LocationImageFromJson(json);

  Map<String, dynamic> toJson() =>
      _$LocationImageToJson(this);

  
}
