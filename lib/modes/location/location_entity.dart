import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modes/location/location_image.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "thumbnail_image", fromJson: _imageWithDefault)
  final LocationImage image;

  LocationEntity( {required this.name, required this.image, required this.description});

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);

  static LocationImage _imageWithDefault(Map<String, dynamic>? image) {
    if (image == null) {
      return LocationImage(path: "");
    }

    return LocationImage(path: image["compressed_path"]);
  }
}
