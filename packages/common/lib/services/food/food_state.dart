part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Object> get props => [];
}

class FoodLoading extends FoodState {}

class FoodFailure extends FoodState {}

class FoodLoaded extends FoodState {
  final Food food;

  const FoodLoaded(this.food);

  @override
  List<Object> get props => [food];
}

class FoodsLoaded extends FoodState {
  final List<Food> foods;

  const FoodsLoaded(this.foods);

  @override
  List<Object> get props => [foods];
}
