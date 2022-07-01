// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationEntity _$LocationEntityFromJson(Map<String, dynamic> json) =>
    LocationEntity(
      name: json['name'] as String,
      image: LocationEntity._imageWithDefault(
          json['thumbnail_image'] as Map<String, dynamic>?),
      description: json['description'] as String,
    );

Map<String, dynamic> _$LocationEntityToJson(LocationEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'thumbnail_image': instance.image,
    };
