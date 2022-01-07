import 'package:fire_chat/domain/entities/user_entity/user_entity.dart';
import 'package:fire_chat/domain/repositories/user_repository/user_repository.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/profile_existence_bloc/profile_existence_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileExistenceBloc extends Bloc<ProfileExistenceBlocEvent, ProfileExistenceBlocState> {
  ProfileExistenceBloc({
    required this.repository,
    UserEntity? initialUser,
  }) : super(
          ProfileExistenceBlocState(
            status: ProfileExistenceBlocStatus.exists,
            user: initialUser,
          ),
        ) {
    on<CreateProfileEvent>((event, emit) {
      emit(
        const ProfileExistenceBlocState(
          status: ProfileExistenceBlocStatus.exists,
        ),
      );
    });
    on<DeleteProfileEvent>((event, emit) async {
      await repository.deleteUser();
      emit(
         const ProfileExistenceBlocState(
          status: ProfileExistenceBlocStatus.notExists,
        ),
      );
    });
  }

  final UserRepository repository;

  void create() => add(CreateProfileEvent());

  void delete() => add(DeleteProfileEvent());
}
