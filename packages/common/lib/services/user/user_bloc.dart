import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/user_repository.dart';

import '../services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({UserRepository? userRepository})
      : _userRepository = userRepository ?? UserRepository(),
        super(UserLoading()) {
    on<AuthenticationBlocUser>(_onAuthenticationBlocUser);
    on<_AuthenticationUserBloc>(_onAuthenticationUserBloc);
    on<_UserUpdated>(_onUserUpdated);
  }

  final UserRepository _userRepository;

  StreamSubscription? _authUserSubscription;
  StreamSubscription<User>? _userSubscription;

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    _userSubscription?.cancel();
    return super.close();
  }

  void _onAuthenticationBlocUser(
      AuthenticationBlocUser event, Emitter<UserState> emit) {
    _authUserSubscription?.cancel();
    try {
      _authUserSubscription = event.authenticationBloc.stream.listen(
        (state) => add(_AuthenticationUserBloc(state.authUser)),
      );
    } catch (_) {}
  }

  void _onAuthenticationUserBloc(
      _AuthenticationUserBloc event, Emitter<UserState> emit) {
    _userSubscription?.cancel();

    if (event.authUser.isEmpty) return emit(UserLoading());

    try {
      _userSubscription = _userRepository
          .streamUser(event.authUser.id)
          .listen((user) => add(_UserUpdated(user)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onUserUpdated(_UserUpdated event, Emitter<UserState> emit) async {
    return emit(UserLoaded(event.user));
  }
}
