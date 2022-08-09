// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Winery _$WineryFromJson(Map<String, dynamic> json) => Winery(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      image:
          Winery._imageWithDefault(json['image_id'] as Map<String, dynamic>?),
      thumbnail:
          Winery._imageWithDefault(json['thumbnail'] as Map<String, dynamic>?),
      gallery: Winery._imagesWithDefault(json['media'] as List?),
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => WineryReview.fromJson(e as Map<String, dynamic>))
          .toList(),
      rating: Winery._ratingWithDefault(json['rating'] as String?),
      reviewsCount: json['reviewsCount'] as int,
      additionalInfo: Map<String, String?>.from(json['wineryProps'] as Map),
      location: Winery._locationWithDefault(
          json['location'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$WineryToJson(Winery instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image_id': instance.image.toJson(),
      'thumbnail': instance.thumbnail.toJson(),
      'media': instance.gallery.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
      'rating': instance.rating,
      'reviewsCount': instance.reviewsCount,
      'wineryProps': instance.additionalInfo,
      'location': instance.location.toJson(),
    };
