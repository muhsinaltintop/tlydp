// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ducks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Duck _$DuckFromJson(Map<String, dynamic> json) => Duck(
      duck_id: json['duck_id'] as int,
      duck_name: json['duck_name'] as String,
      maker_id: json['maker_id'] as int,
      finder_id: json['finder_id'] as int,
      location_found_lat: (json['location_found_lat'] as num).toDouble(),
      location_found_lng: (json['location_found_lng'] as num).toDouble(),
      clue: json['clue'] as String,
      image: json['image'] as String,
      comments: json['comments'] as String,
      maker_name: json['maker_name'] as String,
      finder_name: json['finder_name'] as String,
    );

Map<String, dynamic> _$DuckToJson(Duck instance) => <String, dynamic>{
      'duck_id': instance.duck_id,
      'duck_name': instance.duck_name,
      'maker_id': instance.maker_id,
      'finder_id': instance.finder_id,
      'location_found_lat': instance.location_found_lat,
      'location_found_lng': instance.location_found_lng,
      'clue': instance.clue,
      'image': instance.image,
      'comments': instance.comments,
      'maker_name': instance.maker_name,
      'finder_name': instance.finder_name,
    };
