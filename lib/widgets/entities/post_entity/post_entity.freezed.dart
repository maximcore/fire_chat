// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'post_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostEntity _$PostEntityFromJson(Map<String, dynamic> json) {
  return _PostEntity.fromJson(json);
}

/// @nodoc
class _$PostEntityTearOff {
  const _$PostEntityTearOff();

  _PostEntity call(
      {String? description = AppLocalization.emptyString,
      String? username = AppLocalization.emptyString}) {
    return _PostEntity(
      description: description,
      username: username,
    );
  }

  PostEntity fromJson(Map<String, Object?> json) {
    return PostEntity.fromJson(json);
  }
}

/// @nodoc
const $PostEntity = _$PostEntityTearOff();

/// @nodoc
mixin _$PostEntity {
  String? get description => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostEntityCopyWith<PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostEntityCopyWith<$Res> {
  factory $PostEntityCopyWith(
          PostEntity value, $Res Function(PostEntity) then) =
      _$PostEntityCopyWithImpl<$Res>;
  $Res call({String? description, String? username});
}

/// @nodoc
class _$PostEntityCopyWithImpl<$Res> implements $PostEntityCopyWith<$Res> {
  _$PostEntityCopyWithImpl(this._value, this._then);

  final PostEntity _value;
  // ignore: unused_field
  final $Res Function(PostEntity) _then;

  @override
  $Res call({
    Object? description = freezed,
    Object? username = freezed,
  }) {
    return _then(_value.copyWith(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PostEntityCopyWith<$Res> implements $PostEntityCopyWith<$Res> {
  factory _$PostEntityCopyWith(
          _PostEntity value, $Res Function(_PostEntity) then) =
      __$PostEntityCopyWithImpl<$Res>;
  @override
  $Res call({String? description, String? username});
}

/// @nodoc
class __$PostEntityCopyWithImpl<$Res> extends _$PostEntityCopyWithImpl<$Res>
    implements _$PostEntityCopyWith<$Res> {
  __$PostEntityCopyWithImpl(
      _PostEntity _value, $Res Function(_PostEntity) _then)
      : super(_value, (v) => _then(v as _PostEntity));

  @override
  _PostEntity get _value => super._value as _PostEntity;

  @override
  $Res call({
    Object? description = freezed,
    Object? username = freezed,
  }) {
    return _then(_PostEntity(
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostEntity with DiagnosticableTreeMixin implements _PostEntity {
  const _$_PostEntity(
      {this.description = AppLocalization.emptyString,
      this.username = AppLocalization.emptyString});

  factory _$_PostEntity.fromJson(Map<String, dynamic> json) =>
      _$$_PostEntityFromJson(json);

  @JsonKey()
  @override
  final String? description;
  @JsonKey()
  @override
  final String? username;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostEntity(description: $description, username: $username)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostEntity'))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('username', username));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PostEntity &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.username, username));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(username));

  @JsonKey(ignore: true)
  @override
  _$PostEntityCopyWith<_PostEntity> get copyWith =>
      __$PostEntityCopyWithImpl<_PostEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostEntityToJson(this);
  }
}

abstract class _PostEntity implements PostEntity {
  const factory _PostEntity({String? description, String? username}) =
      _$_PostEntity;

  factory _PostEntity.fromJson(Map<String, dynamic> json) =
      _$_PostEntity.fromJson;

  @override
  String? get description;
  @override
  String? get username;
  @override
  @JsonKey(ignore: true)
  _$PostEntityCopyWith<_PostEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
