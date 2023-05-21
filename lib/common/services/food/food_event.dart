// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'food_bloc.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Object?> get props => [];
}

class StreamFood extends FoodEvent {
  final String restaurantId;
  final String foodId;

  const StreamFood(this.restaurantId, this.foodId);

  @override
  List<Object> get props => [restaurantId, foodId];
}

class GetFood extends FoodEvent {
  final String restaurantId;
  final String foodId;

  const GetFood(this.restaurantId, this.foodId);

  @override
  List<Object> get props => [restaurantId, foodId];
}

class StreamFoods extends FoodEvent {
  final String restaurantId;
  final List<String>? foodIds;

  const StreamFoods(this.restaurantId, {this.foodIds});

  @override
  List<Object?> get props => [restaurantId, foodIds];
}

class GetFoods extends FoodEvent {
  final String restaurantId;
  final List<String>? foodIds;

  const GetFoods(this.restaurantId, this.foodIds);

  @override
  List<Object?> get props => [restaurantId, foodIds];
}

class _FoodUpdated extends FoodEvent {
  final Food food;

  const _FoodUpdated(this.food);

  @override
  List<Object> get props => [food];
}

class _FoodsUpdated extends FoodEvent {
  final List<Food> foods;

  const _FoodsUpdated(this.foods);

  @override
  List<Object> get props => [foods];
}
