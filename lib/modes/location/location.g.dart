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
      entity: LocationEntity.fromJson(json['entity'] as Map<String, dynamic>),
      entityType: $enumDecode(_$LocationTypesEnumMap, json['entity_type']),
      include: json['include'] as bool,
      order: json['order'] as int,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'include': instance.include,
      'order': instance.order,
      'entity': instance.entity.toJson(),
      'entity_type': _$LocationTypesEnumMap[instance.entityType],
    };

const _$LocationTypesEnumMap = {
  LocationTypes.WINERY: 'winery',
  LocationTypes.ATTRACTION: 'attraction',
  LocationTypes.HORECA: 'horeca',
};
