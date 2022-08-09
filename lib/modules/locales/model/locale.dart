import 'package:json_annotation/json_annotation.dart';

part 'locale.g.dart';

@JsonSerializable(explicitToJson: true)
class Locale {
  final String id;
  @JsonKey(name: "locale")
  final String code;

  Locale({required this.id, required this.code});

  factory Locale.fromJson(Map<String, dynamic> json) =>
      _$LocaleFromJson(json);
}
