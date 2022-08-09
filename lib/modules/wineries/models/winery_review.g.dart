// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winery_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineryReview _$WineryReviewFromJson(Map<String, dynamic> json) => WineryReview(
      text: json['comment'] as String,
      rating: WineryReview._ratingWithDefault(json['rating'] as String?),
      date: json['created_at'] as String,
    );

Map<String, dynamic> _$WineryReviewToJson(WineryReview instance) =>
    <String, dynamic>{
      'comment': instance.text,
      'rating': instance.rating,
      'created_at': instance.date,
    };
