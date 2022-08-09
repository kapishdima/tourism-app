import 'package:json_annotation/json_annotation.dart';

part 'winery_review.g.dart';

@JsonSerializable(explicitToJson: true)
class WineryReview {
  @JsonKey(name: "comment")
  final String text;
  @JsonKey(name: "rating", fromJson: _ratingWithDefault)
  final double rating;
  @JsonKey(name: "created_at")
  final String date;

  WineryReview({required this.text, required this.rating, required this.date});

  static double _ratingWithDefault(String? rating) {
    if (rating == null) {
      return 0;
    }

    return double.parse(rating);
  }

  factory WineryReview.fromJson(Map<String, dynamic> json) =>
      _$WineryReviewFromJson(json);

  Map<String, dynamic> toJson() => _$WineryReviewToJson(this);
}
