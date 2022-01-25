import 'dart:developer';

import 'package:fire_chat/domain/providers/auth_providers/auth_provider.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc({required this.authProvider})
      : super(
          AuthBlocState(status: AuthBlocStatus.loading),
        ) {
    on<AnonymousLoginEvent>((event, emit) async {
      final user = await authProvider.signInAnonymously();
      emit(
        AuthBlocState(
          user: user,
          status: AuthBlocStatus.loggedInAnonymously,
        ),
      );
    });
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      final user = await authProvider.createUserWithEmailAndPassword(
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
        await authProvider.signOut();
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

  final AuthProvider authProvider;

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

  void signOut() => add(
        SignOutEvent(),
      );
}
