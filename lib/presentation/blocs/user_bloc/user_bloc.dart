import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/user_bloc/user_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/user_bloc/user_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserBlocEvents, UserBlocState> {
  UserBloc({
    required this.repository,
    UserEntity? editedUser,
  }) : super(
          UserBlocState(status: UserBlocStatus.logouted),
        ) {
    on<LoginUserEvent>((event, emit) async {
      final user = await repository.readUser();
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
          status: UserBlocStatus.logouted,
        ),
      );
    });

    on<DeleteUserEvent>((event, emit) {
      repository.deleteUser();
      emit(
        UserBlocState(
          status: UserBlocStatus.logouted,
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
