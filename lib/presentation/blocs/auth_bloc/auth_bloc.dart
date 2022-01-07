import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_events.dart';
import 'package:fire_chat/presentation/blocs/auth_bloc/auth_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthBloc()
      : super(
          AuthBlocState(status: AuthBlocStatus.loggedOut),
        ) {
    on<LoginEvent>((event, emit) async {
      emit(
        AuthBlocState(
          status: AuthBlocStatus.loggedIn,
        ),
      );
    });

    on<LogoutEvent>((event, emit) {
      emit(
        AuthBlocState(
          status: AuthBlocStatus.loggedOut,
        ),
      );
    });
  }

  void login() => add(LoginEvent());

  void logout() => add(LogoutEvent());
}
