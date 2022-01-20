import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/providers/istorage_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class HiveStorageProvider extends IStorageProvider<UserEntity?> {
  final box = GetIt.instance.get<Box>();

  @override
  bool containsKey(dynamic key) => box.containsKey(key);

  @override
  Future<void> delete(dynamic key) async {
    await box.delete(key);
  }

  @override
  Future<void> put(dynamic key, UserEntity? value) async {
    await box.put(key, value);
  }

  @override
  UserEntity? get(dynamic key, {UserEntity? defaultValue}) {
    return box.get(key) as UserEntity?;
  }
}
