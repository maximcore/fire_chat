import 'package:fire_chat/widgets/entities/post_entity/post_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'posts_bloc_state.freezed.dart';

enum PostsBlocStatus { initial, loading, ready, error }

@freezed
class PostsBlocState with _$PostsBlocState {
   factory PostsBlocState({
    List<PostEntity>? posts,
    required PostsBlocStatus status,
  }) = _PostsBlocState;
}
