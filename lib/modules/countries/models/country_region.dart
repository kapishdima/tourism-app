import 'package:json_annotation/json_annotation.dart';

part 'country_region.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryRegion {
  final int id;
  final String name;

  CountryRegion({required this.name, required this.id});

  factory CountryRegion.fromJson(Map<String, dynamic> json) =>
      _$CountryRegionFromJson(json);

  Map<String, dynamic> toJson() => _$CountryRegionToJson(this);
}
