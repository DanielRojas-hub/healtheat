import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_repository/food_repository.dart';

import '../cart/cart_bloc.dart';

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
    on<CartBlocFoods>(_onCartBlocFoods);
    on<_FoodUpdated>(_onFoodUpdated);
    on<_FoodsUpdated>(_onFoodsUpdated);
  }

  final FoodRepository _foodRepository;

  StreamSubscription? _blocSubscription;
  StreamSubscription? _foodSubscription;

  @override
  Future<void> close() {
    _blocSubscription?.cancel();
    _foodSubscription?.cancel();
    return super.close();
  }

  void _onStreamFood(StreamFood event, Emitter<FoodState> emit) {
    _foodSubscription?.cancel();
    try {
      if (event.restaurantId.isEmpty) return;
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
      if (event.restaurantId.isEmpty) return emit(const FoodsLoaded([]));
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
      if (event.restaurantId.isEmpty) return emit(const FoodsLoaded([]));
      add(_FoodsUpdated(await _foodRepository.getFoods(event.restaurantId,
          foodIds: event.foodIds)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onCartBlocFoods(CartBlocFoods event, Emitter<FoodState> emit) {
    _blocSubscription?.cancel();
    try {
      _blocSubscription = event.cartBloc.stream.listen((state) => add(
          StreamFoods(state.cart.restaurantId,
              foodIds: List.generate(state.cart.petitions.length,
                  (index) => state.cart.petitions[index].foodId))));
      add(StreamFoods(event.cartBloc.state.cart.restaurantId,
          foodIds: List.generate(event.cartBloc.state.cart.petitions.length,
              (index) => event.cartBloc.state.cart.petitions[index].foodId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onFoodUpdated(_FoodUpdated event, Emitter<FoodState> emit) {
    /* return emit(FoodLoaded(event.food)); */
  }

  void _onFoodsUpdated(_FoodsUpdated event, Emitter<FoodState> emit) {
    /* return emit(FoodsLoaded(event.foods)); */
  }
}
