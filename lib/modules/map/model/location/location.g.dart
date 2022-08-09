// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as int,
      address: json['address'] as String,
      lat: Location._stringToDouble(json['lat'] as String?),
      lng: Location._stringToDouble(json['lng'] as String?),
      entity:
          Location._entityWithDefault(json['entity'] as Map<String, dynamic>?),
      entityType:
          Location._entityTypesWithDefault(json['entity_type'] as String?),
      include: Location._includeWithDefault(json['include'] as bool?),
      order: Location._orderWithDefault(json['order'] as int?),
      countryName:
          Location._countryNameWithDefault(json['country_name'] as String?),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'include': instance.include,
      'order': instance.order,
      'country_name': instance.countryName,
      'entity': instance.entity.toJson(),
      'entity_type': _$LocationTypesEnumMap[instance.entityType],
    };

const _$LocationTypesEnumMap = {
  LocationTypes.winery: 'winery',
  LocationTypes.attraction: 'attraction',
  LocationTypes.horeca: 'horeca',
};
