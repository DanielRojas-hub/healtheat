part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationBlocUser extends UserEvent {
  final AuthenticationBloc authenticationBloc;

  const AuthenticationBlocUser(this.authenticationBloc);

  @override
  List<Object> get props => [authenticationBloc];
}

class _AuthenticationUserBloc extends UserEvent {
  final AuthUser authUser;

  const _AuthenticationUserBloc(this.authUser);

  @override
  List<Object> get props => [authUser];
}

class _UserUpdated extends UserEvent {
  final User user;

  const _UserUpdated(this.user);

  @override
  List<Object> get props => [user];
}
