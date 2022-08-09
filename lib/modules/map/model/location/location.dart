import 'package:json_annotation/json_annotation.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_entity.dart';
import 'package:sea_of_wine_app/modules/map/model/location/location_types.dart';
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
  @JsonKey(name: "include", fromJson: _includeWithDefault)
  final bool include;
  @JsonKey(name: "order", fromJson: _orderWithDefault)
  final int order;
  @JsonKey(name: "country_name", fromJson: _countryNameWithDefault)
  final String countryName;

  @JsonKey(name: "entity", fromJson: _entityWithDefault)
  LocationEntity entity;
  @JsonKey(name: "entity_type", fromJson: _entityTypesWithDefault)
  LocationTypes entityType;

  Location({
    required this.id,
    required this.address,
    required this.lat,
    required this.lng,
    required this.entity,
    required this.entityType,
    required this.include,
    required this.order,
    required this.countryName,
  });

  factory Location.empty() => Location(
        id: 0,
        address: "",
        lat: 0,
        lng: 0,
        entity: LocationEntity.empty(),
        entityType: LocationTypes.winery,
        include: false,
        order: -1,
        countryName: "",
      );

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  static LocationEntity _entityWithDefault(Map<String, dynamic>? entity) {
    if (entity == null) {
      return LocationEntity.empty();
    }

    return LocationEntity.fromJson(entity);
  }

  static LocationTypes _entityTypesWithDefault(String? entityType) {
    if (entityType == null) {
      return LocationTypes.winery;
    }

    return $enumDecode(_$LocationTypesEnumMap, entityType);
  }

  static bool _includeWithDefault(bool? value) => value ?? false;
  static int _orderWithDefault(int? value) => value ?? -1;
  static String _countryNameWithDefault(String? value) => value ?? "";

  static double _stringToDouble(String? value) =>
      value == null ? 0 : double.parse(value);

  String get icon {
    switch (entityType) {
      case LocationTypes.winery:
        return MarkerIcons.wineries;
      case LocationTypes.attraction:
        return MarkerIcons.touristAttractions;
      case LocationTypes.horeca:
        return MarkerIcons.hotels;
      default:
        return MarkerIcons.wineries;
    }
  }
}
