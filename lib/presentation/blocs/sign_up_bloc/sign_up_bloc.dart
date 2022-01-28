import 'dart:developer';

import 'package:fire_chat/domain/repositories/auth_repository/auth_repository.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/sign_up_bloc/sign_up_bloc_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc
    extends Bloc<SignUpBlocEvent, SignUpBlocState> {
  SignUpBloc({required this.authProvider})
      : super(
          SignUpBlocState(
            status: SignUpBlocStatus.initial,
          ),
        ) {
    on<SignUpWithEmailAndPasswordEvent>((event, emit) async {
      try {
        emit(
          SignUpBlocState(
            status: SignUpBlocStatus.loading,
          ),
        );
        final user = await authProvider.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(
          SignUpBlocState(
            status: SignUpBlocStatus.ready,
            user: user,
          ),
        );
      } on FirebaseAuthException catch (error) {
        log(error.toString());
        emit(
          SignUpBlocState(
            status: SignUpBlocStatus.error,
            errorMessage: error.message,
          ),
        );
        rethrow;
      } catch (error) {
        emit(
          SignUpBlocState(
            status: SignUpBlocStatus.error,
          ),
        );
        log(error.toString());
        emit(
          SignUpBlocState(
            status: SignUpBlocStatus.loading,
          ),
        );
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
        SignUpWithEmailAndPasswordEvent(
          email: email,
          password: password,
        ),
      );
}
