import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_navbar_bloc_state.freezed.dart';

enum FeedNavbarStatus { all, filtered }

@freezed
class FeedNavbarBlocState with _$FeedNavbarBlocState {
  factory FeedNavbarBlocState({
    required FeedNavbarStatus status,
  }) = _FeedNavbarBlocState;
}
