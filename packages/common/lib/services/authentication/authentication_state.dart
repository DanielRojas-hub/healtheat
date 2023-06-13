part of 'authentication_bloc.dart';

enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}

final class AuthenticationState extends Equatable {
  const AuthenticationState._({
    required this.status,
    this.authUser = AuthUser.empty,
  });

  const AuthenticationState.authenticated(AuthUser authUser)
      : this._(status: AuthenticationStatus.authenticated, authUser: authUser);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final AuthUser authUser;

  @override
  List<Object> get props => [status, authUser];
}
