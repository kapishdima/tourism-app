import 'package:json_annotation/json_annotation.dart';

enum LocationTypes {
  @JsonValue("winery")
  WINERY,
  @JsonValue("attraction")
  ATTRACTION,
  @JsonValue("horeca")
  HORECA,
}