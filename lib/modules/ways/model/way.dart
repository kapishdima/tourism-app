import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

import './way_image.dart';

part 'way.g.dart';

@JsonSerializable(explicitToJson: true)
class Way {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "text")
  final String text;

  @JsonKey(name: "pdf_url", fromJson: _pdfWithDefault)
  final String pdfUrl;

  @JsonKey(name: "thumbnail_id", fromJson: _imageWithDefault)
  final WayImage thumbnail;
  @JsonKey(name: "image_id", fromJson: _imageWithDefault)
  final WayImage image;
  @JsonKey(name: "gallery", fromJson: _imagesWithDefault)
  final List<WayImage> gallery;

  Way({
    required this.id,
    required this.name,
    required this.text,
    required this.pdfUrl,
    required this.thumbnail,
    required this.gallery,
    required this.image,
  });

  factory Way.fromJson(Map<String, dynamic> json) => _$WayFromJson(json);

  static String _pdfWithDefault(Map<String, dynamic>? pdf) {
    return "";
  }

  static WayImage _imageWithDefault(Map<String, dynamic>? image) {
    if (image == null) {
      return WayImage(url: "");
    }

    return WayImage(
        url: image["url"].toString().contains("storage")
            ? "${ApiSettings.baseUrl}${image["url"]}"
            : image["url"]);
  }

  static List<WayImage> _imagesWithDefault(List<dynamic>? images) {
    return images?.map(((image) {
          return _imageWithDefault(image);
        })).toList() ??
        [];
  }
}
