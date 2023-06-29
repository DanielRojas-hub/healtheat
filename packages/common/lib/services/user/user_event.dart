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

class UpdateUser extends UserEvent {
  final User user;
  final Map<String, dynamic> data;

  const UpdateUser(this.user, this.data);

  @override
  List<Object> get props => [user, data];
}

class ChangeFavoriteRestaurants extends UserEvent {
  final String restaurantId;

  const ChangeFavoriteRestaurants(this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}

class ChangeFavoriteDishes extends UserEvent {
  final String foodId;

  const ChangeFavoriteDishes(this.foodId);

  @override
  List<Object> get props => [foodId];
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
