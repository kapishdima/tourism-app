import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_image.dart';

part 'location_entity.g.dart';

@JsonSerializable()
class LocationEntity {
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "thumbnail_image", fromJson: _imageWithDefault)
  final LocationImage image;

  @JsonKey(name: "rating", fromJson: _ratingWithDefault)
  final double rating;
  @JsonKey(name: "reviews_count", fromJson: _reviewsCountWithDefault)
  final int raviewsCount;

  LocationEntity({
    required this.name,
    required this.image,
    required this.description,
    required this.rating,
    required this.raviewsCount,
  });

  factory LocationEntity.empty() => LocationEntity(
        name: "",
        image: LocationImage.empty(),
        description: "",
        rating: 0,
        raviewsCount: 0,
      );

  factory LocationEntity.fromJson(Map<String, dynamic> json) =>
      _$LocationEntityFromJson(json);

  Map<String, dynamic> toJson() => _$LocationEntityToJson(this);

  static LocationImage _imageWithDefault(Map<String, dynamic>? image) {
    if (image == null) {
      return LocationImage(
          path:
              "https://seaofwine.fra1.digitaloceanspaces.com/uploads/compressed/202206021155326298a5348df2d.5.jpg");
    }

    return LocationImage(path: image["compressed_path"]);
  }

  static double _ratingWithDefault(double? rating) {
    if (rating == null) {
      return 0;
    }

    return rating;
  }

  static int _reviewsCountWithDefault(int? reviewsCount) {
    if (reviewsCount == null) {
      return 0;
    }

    return reviewsCount;
  }
}
