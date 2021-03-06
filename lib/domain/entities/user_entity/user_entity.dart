import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  @HiveType(typeId: 1)
  const factory UserEntity({
    @HiveField(0) @Default('') String username,
    @HiveField(1) @Default('') String email,
    @HiveField(2) required String id,
    @HiveField(3) @Default('') String profilePictureUrl,
    @HiveField(4) @Default(<String>[]) List<String> followers,
    @HiveField(5) @Default(<String>[]) List<String> following,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
