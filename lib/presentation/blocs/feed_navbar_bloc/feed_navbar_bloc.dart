import 'package:fire_chat/presentation/blocs/feed_navbar_bloc/feed_navbar_bloc_state.dart';
import 'package:fire_chat/presentation/blocs/feed_navbar_bloc/feed_navbar_events.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedNavbarBloc extends Bloc<FeedNavbarEvent, FeedNavbarBlocState> {
  FeedNavbarBloc()
      : super(
          FeedNavbarBlocState(status: FeedNavbarStatus.all),
        ) {
    on<FilterPostsEvent>((event, emit) {
      emit(
        state.copyWith(status: FeedNavbarStatus.filtered),
      );
    });
    on<AllPostsEvent>((event, emit) {
      emit(
        state.copyWith(status: FeedNavbarStatus.all),
      );
    });
  }

  void filter() => add(FilterPostsEvent());

  void all() => add(AllPostsEvent());
}
