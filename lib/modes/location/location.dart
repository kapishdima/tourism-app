import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modes/location/location_entity.dart';
import 'package:sea_of_wine_app/modes/location/location_types.dart';
import 'package:sea_of_wine_app/settings/constans.dart';

part 'location.g.dart';

@JsonSerializable(explicitToJson: true)
class Location {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "address")
  final String address;
  @JsonKey(name: "lat", fromJson: _stringToDouble)
  final double lat;
  @JsonKey(name: "lng", fromJson: _stringToDouble)
  final double lng;
  @JsonKey(name: "include")
  final bool include;
  @JsonKey(name: "order")
  final int order;

  LocationEntity entity;
  @JsonKey(name: "entity_type")
  LocationTypes entityType;

  Location(
      {required this.id,
      required this.address,
      required this.lat,
      required this.lng,
      required this.entity,
      required this.entityType,
      required this.include,
      required this.order,
      });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  static double _stringToDouble(String? value) =>
      value == null ? 0 : double.parse(value);

  String get icon {
    switch (entityType) {
      case LocationTypes.WINERY:
        return MarkerIcons.wineries;
      case LocationTypes.ATTRACTION:
        return MarkerIcons.touristAttractions;
      case LocationTypes.HORECA:
        return MarkerIcons.hotels;
      default:
        return MarkerIcons.wineries;
    }
  }
}
