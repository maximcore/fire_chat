import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/user_bloc/user_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class AuthBloc extends Bloc<UserBlocEvents, UserBlocState> {
  AuthBloc({
    required this.repository,
    UserEntity? editedUser,
  }) : super(
          UserBlocState(user: editedUser, status: UserBlocStatus.logged),
        ) {
    final box = GetIt.instance<Box>();
    on<LoginUserEvent>((event, emit) async {
      final fetchedUser = await repository.readUser();
      late final UserEntity user;
      if (fetchedUser == null) {
        user = UserEntity(
          username: 'DefaultUsername${DateTime.now()}',
          email: 'defaultuser@gmail.com',
          id: '0',
          profilePictureUrl:
              'https://static.wikia.nocookie.net/nickelodeon-movies/images/7/7e/Patrick_Star.png/revision/latest?cb=20180107193038',
        );
        await box.put(StorageKeys.userHiveKey, user);
      }
      emit(
        UserBlocState(
          status: UserBlocStatus.logged,
          user: user,
        ),
      );
    });

    on<LogoutUserEvent>((event, emit) {
      emit(
        UserBlocState(
          status: UserBlocStatus.loggedOut,
        ),
      );
    });

    on<DeleteUserEvent>((event, emit) {
      repository.deleteUser();
      emit(
        UserBlocState(
          status: UserBlocStatus.loggedOut,
        ),
      );
    });

    on<EditUserEvent>((event, emit) async {
      // TODO(Maxim): handle case user == null
      await repository.editUser(editedUser!);
      final user = await repository.readUser();

      emit(
        UserBlocState(
          status: UserBlocStatus.logged,
          user: user,
        ),
      );
    });
  }

  UserRepository repository;

  void login() => add(LoginUserEvent());

  void logout() => add(LogoutUserEvent());

  void edit() => add(EditUserEvent());

  void delete() => add(DeleteUserEvent());
}
