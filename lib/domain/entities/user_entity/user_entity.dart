import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity extends HiveObject
    with _$UserEntity {

  @HiveType(typeId: 1)
  const factory UserEntity({
    @HiveField(0) @Default('') String username,
    @HiveField(1) @Default('') String email,
    @HiveField(2) @Default('') String id,
    @HiveField(3) @Default('') String profilePictureUrl,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}

// class UserEntityAdapter extends TypeAdapter<UserEntity> {
//   @override
//   final typeId = 0;
//
//   @override
//   UserEntity read(BinaryReader reader) {
//     return UserEntity.fromJson(reader.read() as Map<String, dynamic>);
//   }
//
//   @override
//   void write(BinaryWriter writer, UserEntity obj) {
//     writer.write<Map<String, dynamic>?>(obj.toJson());
//   }
// }
