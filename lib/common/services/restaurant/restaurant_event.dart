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
  final List<String>? categoryRestaurantIds;

  const StreamRestaurants({this.restaurantIds, this.categoryRestaurantIds});

  @override
  List<Object?> get props => [restaurantIds, categoryRestaurantIds];
}

class GetRestaurants extends RestaurantEvent {
  final List<String>? restaurantIds;
  final List<String>? categoryRestaurantIds;

  const GetRestaurants({this.restaurantIds, this.categoryRestaurantIds});

  @override
  List<Object?> get props => [restaurantIds, categoryRestaurantIds];
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
