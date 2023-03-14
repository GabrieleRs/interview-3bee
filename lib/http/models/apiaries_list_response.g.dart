// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiaries_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Initial _$$_InitialFromJson(Map<String, dynamic> json) => _$_Initial(
      results: (json['results'] as List<dynamic>)
          .map((e) => ApiariesLineResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_InitialToJson(_$_Initial instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
