import 'package:json_annotation/json_annotation.dart';
part 'winery_location.g.dart';

@JsonSerializable(explicitToJson: true)
class WineryLocation {
  final double lat;
  final double lng;

  WineryLocation({required this.lat, required this.lng});

  factory WineryLocation.fromJson(Map<String, dynamic> json) => _$WineryLocationFromJson(json);

  Map<String, dynamic> toJson() => _$WineryLocationToJson(this);
}
