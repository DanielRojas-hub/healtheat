part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object?> get props => [];
}

class StreamRestaurant extends RestaurantEvent {
  final String restaurantId;

  const StreamRestaurant(this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}

class GetRestaurant extends RestaurantEvent {
  final String restaurantId;

  const GetRestaurant(this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}

class StreamRestaurants extends RestaurantEvent {
  final List<String>? restaurantIds;
  final List<String>? preferenceIds;

  const StreamRestaurants({this.restaurantIds, this.preferenceIds});

  @override
  List<Object?> get props => [restaurantIds, preferenceIds];
}

class GetRestaurants extends RestaurantEvent {
  final List<String>? restaurantIds;
  final List<String>? preferenceIds;

  const GetRestaurants({this.restaurantIds, this.preferenceIds});

  @override
  List<Object?> get props => [restaurantIds, preferenceIds];
}

class CartBlocRestaurant extends RestaurantEvent {
  final CartBloc cartBloc;

  const CartBlocRestaurant(this.cartBloc);

  @override
  List<Object?> get props => [cartBloc];
}

class UserPreferenceBlocRestaurants extends RestaurantEvent {
  final UserPreferenceBloc userPreferenceBloc;

  const UserPreferenceBlocRestaurants(this.userPreferenceBloc);

  @override
  List<Object?> get props => [userPreferenceBloc];
}

class _RestaurantUpdated extends RestaurantEvent {
  final Restaurant restaurant;

  const _RestaurantUpdated(this.restaurant);

  @override
  List<Object> get props => [restaurant];
}

class _RestaurantsUpdated extends RestaurantEvent {
  final List<Restaurant> restaurants;

  const _RestaurantsUpdated(this.restaurants);

  @override
  List<Object> get props => [restaurants];
}
