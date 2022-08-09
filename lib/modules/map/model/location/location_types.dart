import 'package:json_annotation/json_annotation.dart';

enum LocationTypes {
  @JsonValue("winery")
  winery,
  @JsonValue("attraction")
  attraction,
  @JsonValue("horeca")
  horeca,
}