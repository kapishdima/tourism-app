import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_entity.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_image.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_types.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery_image.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery_location.dart';
import 'package:sea_of_wine_app/modules/wineries/models/winery_review.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

part 'winery.g.dart';

@JsonSerializable(explicitToJson: true)
class Winery {
  int id;
  String name;
  String description;

  @JsonKey(name: "image_id", fromJson: _imageWithDefault)
  WineryImage image;

  @JsonKey(name: "thumbnail", fromJson: _imageWithDefault)
  WineryImage thumbnail;

  @JsonKey(name: "media", fromJson: _imagesWithDefault)
  List<WineryImage> gallery;

  @JsonKey(name: "reviews")
  List<WineryReview> reviews;

  @JsonKey(name: "rating", fromJson: _ratingWithDefault)
  double rating;
  int reviewsCount;

  @JsonKey(name: "wineryProps")
  Map<String, String?> additionalInfo;

  @JsonKey(name: "location", fromJson: _locationWithDefault)
  Location location;

  Winery({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.thumbnail,
    required this.gallery,
    required this.reviews,
    required this.rating,
    required this.reviewsCount,
    required this.additionalInfo,
    required this.location,
  });

  static WineryImage _imageWithDefault(Map<String, dynamic>? image) {
    if (image == null) {
      return WineryImage(url: "");
    }

    return WineryImage(
        url: image["url"].toString().contains("storage")
            ? "${ApiSettings.baseUrl}${image["url"]}"
            : image["url"]);
  }

  static List<WineryImage> _imagesWithDefault(List<dynamic>? images) {
    return images?.map(((image) {
          return _imageWithDefault(image);
        })).toList() ??
        [];
  }

  static double _ratingWithDefault(String? rating) {
    if (rating == null) {
      return 0;
    }
    return double.parse(rating);
  }

  static Location _locationWithDefault(Map<String, dynamic>? location) {
    if (location == null) {
      return Location.empty();
    }

    return Location.fromJson(location);
  }

  static Location toLocation(winery) {
    return Location(
        id: winery.location.id,
        address: winery.location.address,
        lat: winery.location.lat,
        lng: winery.location.lng,
        entity: LocationEntity(
            name: winery.name,
            description: winery.description,
            image: LocationImage(path: winery.thumbnail.url),
            rating: winery.rating,
            raviewsCount: winery.reviewsCount),
        entityType: LocationTypes.winery,
        include: false,
        order: -1,
        countryName: "");
  }

  factory Winery.fromJson(Map<String, dynamic> json) => _$WineryFromJson(json);

  Map<String, dynamic> toJson() => _$WineryToJson(this);
}
