// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'way.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Way _$WayFromJson(Map<String, dynamic> json) => Way(
      id: json['id'] as int,
      name: json['name'] as String,
      text: json['text'] as String,
      pdfUrl: json['pdf_url'] as String,
    );

Map<String, dynamic> _$WayToJson(Way instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'text': instance.text,
      'pdf_url': instance.pdfUrl,
    };
