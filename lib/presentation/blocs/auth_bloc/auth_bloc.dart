import 'dart:developer';

import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc({required this.authRepository})
      : super(
          AuthBlocState(status: AuthBlocStatus.loading),
        ) {
    on<AnonymousLoginEvent>((event, emit) async {
      final user = await authRepository.signInAnonymously();
      emit(
        AuthBlocState(
          user: user,
          status: AuthBlocStatus.loggedInAnonymously,
        ),
      );
    });
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      final user = await authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(
        AuthBlocState(
          user: user,
          status: AuthBlocStatus.loggedInWithEmailAndPassword,
        ),
      );
    });
    on<LoginWithEmailAndPasswordAfterRegistrationEvent>((event, emit) async {
      final user = await authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(
        AuthBlocState(
          user: user,
          status: AuthBlocStatus.loggedInWithEmailAndPassword,
        ),
      );
    });
    on<SignOutEvent>((event, emit) async {
      try {
        emit(
          state.copyWith(status: AuthBlocStatus.loading),
        );

        await authRepository.signOut();

        emit(
          AuthBlocState(
            status: AuthBlocStatus.loggedOut,
          ),
        );

      } catch (error) {
        log(error.toString());
      }
    });
  }

  final AuthRepository authRepository;

  void loginAnonymously() => add(
        AnonymousLoginEvent(),
      );

  void loginWithEmailAndPassword({
    required String email,
    required String password,
  }) =>
      add(
        LoginWithEmailAndPasswordEvent(
          email: email,
          password: password,
        ),
      );

  void loginWithEmailAndPasswordAfterRegistration({
    required String email,
    required String password,
  }) =>
      add(
        LoginWithEmailAndPasswordAfterRegistrationEvent(
          email: email,
          password: password,
        ),
      );

  void signOut() => add(
        SignOutEvent(),
      );
}
