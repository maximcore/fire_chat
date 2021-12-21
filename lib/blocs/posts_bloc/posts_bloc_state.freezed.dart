// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'posts_bloc_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PostsBlocStateTearOff {
  const _$PostsBlocStateTearOff();

  _PostsBlocState call(
      {List<PostEntity>? posts, required PostsBlocStatus status}) {
    return _PostsBlocState(
      posts: posts,
      status: status,
    );
  }
}

/// @nodoc
const $PostsBlocState = _$PostsBlocStateTearOff();

/// @nodoc
mixin _$PostsBlocState {
  List<PostEntity>? get posts => throw _privateConstructorUsedError;
  PostsBlocStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostsBlocStateCopyWith<PostsBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsBlocStateCopyWith<$Res> {
  factory $PostsBlocStateCopyWith(
          PostsBlocState value, $Res Function(PostsBlocState) then) =
      _$PostsBlocStateCopyWithImpl<$Res>;
  $Res call({List<PostEntity>? posts, PostsBlocStatus status});
}

/// @nodoc
class _$PostsBlocStateCopyWithImpl<$Res>
    implements $PostsBlocStateCopyWith<$Res> {
  _$PostsBlocStateCopyWithImpl(this._value, this._then);

  final PostsBlocState _value;
  // ignore: unused_field
  final $Res Function(PostsBlocState) _then;

  @override
  $Res call({
    Object? posts = freezed,
    Object? status = freezed,
  }) {
    return _then(_value.copyWith(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostsBlocStatus,
    ));
  }
}

/// @nodoc
abstract class _$PostsBlocStateCopyWith<$Res>
    implements $PostsBlocStateCopyWith<$Res> {
  factory _$PostsBlocStateCopyWith(
          _PostsBlocState value, $Res Function(_PostsBlocState) then) =
      __$PostsBlocStateCopyWithImpl<$Res>;
  @override
  $Res call({List<PostEntity>? posts, PostsBlocStatus status});
}

/// @nodoc
class __$PostsBlocStateCopyWithImpl<$Res>
    extends _$PostsBlocStateCopyWithImpl<$Res>
    implements _$PostsBlocStateCopyWith<$Res> {
  __$PostsBlocStateCopyWithImpl(
      _PostsBlocState _value, $Res Function(_PostsBlocState) _then)
      : super(_value, (v) => _then(v as _PostsBlocState));

  @override
  _PostsBlocState get _value => super._value as _PostsBlocState;

  @override
  $Res call({
    Object? posts = freezed,
    Object? status = freezed,
  }) {
    return _then(_PostsBlocState(
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostEntity>?,
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PostsBlocStatus,
    ));
  }
}

/// @nodoc

class _$_PostsBlocState implements _PostsBlocState {
  _$_PostsBlocState({this.posts, required this.status});

  @override
  final List<PostEntity>? posts;
  @override
  final PostsBlocStatus status;

  @override
  String toString() {
    return 'PostsBlocState(posts: $posts, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostsBlocState &&
            const DeepCollectionEquality().equals(other.posts, posts) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(posts),
      const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$PostsBlocStateCopyWith<_PostsBlocState> get copyWith =>
      __$PostsBlocStateCopyWithImpl<_PostsBlocState>(this, _$identity);
}

abstract class _PostsBlocState implements PostsBlocState {
  factory _PostsBlocState(
      {List<PostEntity>? posts,
      required PostsBlocStatus status}) = _$_PostsBlocState;

  @override
  List<PostEntity>? get posts;
  @override
  PostsBlocStatus get status;
  @override
  @JsonKey(ignore: true)
  _$PostsBlocStateCopyWith<_PostsBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
