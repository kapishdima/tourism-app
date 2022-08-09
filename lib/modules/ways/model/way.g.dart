// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'way.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Way _$WayFromJson(Map<String, dynamic> json) => Way(
      id: json['id'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      pdfUrl: Way._pdfWithDefault(json['pdf_url'] as Map<String, dynamic>?),
      thumbnail:
          Way._imageWithDefault(json['thumbnail_id'] as Map<String, dynamic>?),
      gallery: Way._imagesWithDefault(json['gallery'] as List?),
      image: Way._imageWithDefault(json['image_id'] as Map<String, dynamic>?),
    );

Map<String, dynamic> _$WayToJson(Way instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'pdf_url': instance.pdfUrl,
      'thumbnail_id': instance.thumbnail.toJson(),
      'image_id': instance.image.toJson(),
      'gallery': instance.gallery.map((e) => e.toJson()).toList(),
    };
