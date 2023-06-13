part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantLoading extends RestaurantState {}

class RestaurantFailure extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  final Restaurant restaurant;

  const RestaurantLoaded(this.restaurant);

  @override
  List<Object> get props => [restaurant];
}

class RestaurantsLoaded extends RestaurantState {
  final List<Restaurant> restaurants;

  const RestaurantsLoaded(this.restaurants);

  @override
  List<Object> get props => [restaurants];
}
