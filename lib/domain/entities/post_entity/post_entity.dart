import 'package:fire_chat/domain/entities/comment_entity/comment_entity.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_entity.freezed.dart';

part 'post_entity.g.dart';

@freezed
class PostEntity with _$PostEntity {
  const factory PostEntity({
    @Default('') String description,
    @Default(UserEntity(id: '')) UserEntity user,
    @Default(<String>[]) List<String> postLikedByUsers,
    @Default(<CommentEntity>[]) List<CommentEntity> comments,
    @Default(<Map<String, String>>[])
        List<Map<String, String>> postCommentedByUsers,
    String? imageUrl,
    @Default('0') String postId,
  }) = _PostEntity;

  factory PostEntity.fromJson(Map<String, dynamic> json) =>
      _$PostEntityFromJson(json);
}
