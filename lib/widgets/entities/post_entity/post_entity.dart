import 'package:fire_chat/string_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    @Default(AppLocalization.emptyString) String? description,
    @Default(AppLocalization.emptyString) String? username,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
