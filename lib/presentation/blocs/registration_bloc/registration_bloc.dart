import 'dart:developer';

import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/registration_bloc/registration_bloc_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationBloc
    extends Bloc<RegistrationBlocEvent, RegistrationBlocState> {
  RegistrationBloc({required this.authProvider})
      : super(
          RegistrationBlocState(
            status: RegistrationBlocStatus.initial,
          ),
        ) {
    on<RegistrationWithEmailAndPasswordEvent>((event, emit) async {
      try {
        emit(
          RegistrationBlocState(
            status: RegistrationBlocStatus.loading,
          ),
        );
        final user = await authProvider.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(
          RegistrationBlocState(
            status: RegistrationBlocStatus.ready,
            user: user,
          ),
        );
      } on FirebaseAuthException catch (error) {
        log(error.toString());
        emit(
          RegistrationBlocState(
            status: RegistrationBlocStatus.error,
          ),
        );
        rethrow;
      } catch (error) {
        emit(
          RegistrationBlocState(
            status: RegistrationBlocStatus.error,
          ),
        );
        log(error.toString());
        rethrow;
      }
    });
  }

  final AuthRepository authProvider;

  void createUser({
    required String email,
    required String password,
  }) =>
      add(
        RegistrationWithEmailAndPasswordEvent(
          email: email,
          password: password,
        ),
      );
}
