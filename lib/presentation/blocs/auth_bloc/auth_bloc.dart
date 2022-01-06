import 'package:fire_chat/core/constants.dart';
import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc({
    required this.repository,
    // TODO(Maxim): Rename editedUser parameter
    UserEntity? editedUser,
  }) : super(
          AuthBlocState(user: editedUser, status: AuthBlocStatus.signedIn),
        ) {
    final box = GetIt.instance<Box>();
    on<LoginEvent>((event, emit) async {
      var user = await repository.readUser();
      if (user == null) {
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
        AuthBlocState(
          status: AuthBlocStatus.signedIn,
          user: user,
        ),
      );
    });

    on<LogoutEvent>((event, emit) {
      emit(
        AuthBlocState(
          status: AuthBlocStatus.signedOut,
        ),
      );
    });
  }

  UserRepository repository;

  void login() => add(LoginEvent());

  void logout() => add(LogoutEvent());
}
