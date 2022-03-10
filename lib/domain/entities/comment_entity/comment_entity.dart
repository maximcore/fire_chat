import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_entity.freezed.dart';

part 'comment_entity.g.dart';

@freezed
class CommentEntity with _$CommentEntity {
  const factory CommentEntity({
    @Default('') String comment,
    @Default(UserEntity(id: '')) UserEntity user,
  }) = _CommentEntity;

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);
}