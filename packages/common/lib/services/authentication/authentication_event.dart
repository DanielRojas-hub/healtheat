part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

final class AppLogoutRequested extends AuthenticationEvent {
  const AppLogoutRequested();
}

final class _AppUserChanged extends AuthenticationEvent {
  const _AppUserChanged(this.user);

  final AuthUser user;
}
