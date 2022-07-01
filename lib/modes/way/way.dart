import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modes/location/location.dart';

part 'way.g.dart';

@JsonSerializable(explicitToJson: true)
class Way {
  @JsonKey(name: "id")
  final int id;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "text")
  final String text;

  @JsonKey(name: "pdf_url")
  final String pdfUrl;

  Way(
      {required this.id,
      required this.name,
      required this.text,
      required this.pdfUrl});

  factory Way.fromJson(Map<String, dynamic> json) => _$WayFromJson(json);
}
