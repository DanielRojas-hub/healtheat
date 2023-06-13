import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
      {required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(authenticationRepository.currentUser.isNotEmpty
            ? AuthenticationState.authenticated(
                authenticationRepository.currentUser)
            : const AuthenticationState.unauthenticated()) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _authUserSubscription = _authenticationRepository.authUser.listen(
      (authUser) => add(_AppUserChanged(authUser)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<AuthUser> _authUserSubscription;

  void _onUserChanged(
      _AppUserChanged event, Emitter<AuthenticationState> emit) {
    emit(
      event.user.isNotEmpty
          ? AuthenticationState.authenticated(event.user)
          : const AuthenticationState.unauthenticated(),
    );
  }

  void _onLogoutRequested(
      AppLogoutRequested event, Emitter<AuthenticationState> emit) {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _authUserSubscription.cancel();
    return super.close();
  }
}
