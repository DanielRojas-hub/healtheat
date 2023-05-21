import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_repository/food_repository.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc({FoodRepository? foodRepository})
      : _foodRepository = foodRepository ?? FoodRepository(),
        super(FoodLoading()) {
    on<StreamFood>(_onStreamFood);
    on<GetFood>(_onGetFood);
    on<StreamFoods>(_onStreamFoods);
    on<GetFoods>(_onGetFoods);
    on<_FoodUpdated>(_onFoodUpdated);
    on<_FoodsUpdated>(_onFoodsUpdated);
  }

  final FoodRepository _foodRepository;

  StreamSubscription? _foodSubscription;

  @override
  Future<void> close() {
    _foodSubscription?.cancel();
    return super.close();
  }

  void _onStreamFood(StreamFood event, Emitter<FoodState> emit) {
    _foodSubscription?.cancel();
    try {
      _foodSubscription = _foodRepository
          .streamFood(event.restaurantId, event.foodId)
          .listen((food) => add(_FoodUpdated(food)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetFood(GetFood event, Emitter<FoodState> emit) async {
    _foodSubscription?.cancel();
    try {
      add(_FoodUpdated(
          await _foodRepository.getFood(event.restaurantId, event.foodId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamFoods(StreamFoods event, Emitter<FoodState> emit) {
    _foodSubscription?.cancel();
    try {
      _foodSubscription = _foodRepository
          .streamFoods(event.restaurantId, foodIds: event.foodIds)
          .listen((foods) => add(_FoodsUpdated(foods)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetFoods(GetFoods event, Emitter<FoodState> emit) async {
    _foodSubscription?.cancel();
    try {
      add(_FoodsUpdated(await _foodRepository.getFoods(event.restaurantId,
          foodIds: event.foodIds)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onFoodUpdated(_FoodUpdated event, Emitter<FoodState> emit) {
    return emit(FoodLoaded(event.food));
  }

  void _onFoodsUpdated(_FoodsUpdated event, Emitter<FoodState> emit) {
    return emit(FoodsLoaded(event.foods));
  }
}
