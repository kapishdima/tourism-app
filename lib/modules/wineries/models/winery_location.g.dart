// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winery_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WineryLocation _$WineryLocationFromJson(Map<String, dynamic> json) =>
    WineryLocation(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );

Map<String, dynamic> _$WineryLocationToJson(WineryLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
