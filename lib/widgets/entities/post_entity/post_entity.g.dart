// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostEntity _$$_PostEntityFromJson(Map<String, dynamic> json) =>
    _$_PostEntity(
      description:
          json['description'] as String? ?? AppLocalization.emptyString,
      username: json['username'] as String? ?? AppLocalization.emptyString,
    );

Map<String, dynamic> _$$_PostEntityToJson(_$_PostEntity instance) =>
    <String, dynamic>{
      'description': instance.description,
      'username': instance.username,
    };
