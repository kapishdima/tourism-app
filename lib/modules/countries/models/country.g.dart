// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnail:
          Country._imageWithDefault(json['thumbnail'] as Map<String, dynamic>?),
      description: json['first_block_title'] as String,
      code: json['code'] as String,
      text: json['first_block_text'] as String,
      gallery: Country._imagesWithDefault(json['gallery'] as List?),
      regions: (json['regions'] as List<dynamic>)
          .map((e) => CountryRegion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'first_block_title': instance.description,
      'first_block_text': instance.text,
      'thumbnail': instance.thumbnail.toJson(),
      'gallery': instance.gallery.map((e) => e.toJson()).toList(),
      'regions': instance.regions.map((e) => e.toJson()).toList(),
    };
