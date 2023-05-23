import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:healtheat/common/services/cart/cart_bloc.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  RestaurantBloc({RestaurantRepository? restaurantRepository})
      : _restaurantRepository = restaurantRepository ?? RestaurantRepository(),
        super(RestaurantLoading()) {
    on<StreamRestaurant>(_onStreamRestaurant);
    on<GetRestaurant>(_onGetRestaurant);
    on<StreamRestaurants>(_onStreamRestaurants);
    on<GetRestaurants>(_onGetRestaurants);
    on<CartBlocRestaurant>(_onCartBlocRestaurant);
    on<_RestaurantUpdated>(_onRestaurantUpdated);
    on<_RestaurantsUpdated>(_onRestaurantsUpdated);
  }

  final RestaurantRepository _restaurantRepository;

  StreamSubscription? _blocSubscription;
  StreamSubscription? _restaurantSubscription;

  @override
  Future<void> close() {
    _blocSubscription?.cancel();
    _restaurantSubscription?.cancel();
    return super.close();
  }

  void _onStreamRestaurant(
      StreamRestaurant event, Emitter<RestaurantState> emit) {
    _restaurantSubscription?.cancel();
    try {
      _restaurantSubscription = _restaurantRepository
          .streamRestaurant(event.restaurantId)
          .listen((restaurant) => add(_RestaurantUpdated(restaurant)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetRestaurant(
      GetRestaurant event, Emitter<RestaurantState> emit) async {
    _restaurantSubscription?.cancel();
    try {
      add(_RestaurantUpdated(
          await _restaurantRepository.getRestaurant(event.restaurantId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamRestaurants(
      StreamRestaurants event, Emitter<RestaurantState> emit) {
    _restaurantSubscription?.cancel();
    try {
      _restaurantSubscription = _restaurantRepository
          .streamRestaurants(
              restaurantIds: event.restaurantIds,
              categoryRestaurantIds: event.categoryRestaurantIds)
          .listen((restaurants) => add(_RestaurantsUpdated(restaurants)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetRestaurants(
      GetRestaurants event, Emitter<RestaurantState> emit) async {
    _restaurantSubscription?.cancel();
    try {
      add(_RestaurantsUpdated(await _restaurantRepository.getRestaurants(
          restaurantIds: event.restaurantIds,
          categoryRestaurantIds: event.categoryRestaurantIds)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onCartBlocRestaurant(
      CartBlocRestaurant event, Emitter<RestaurantState> emit) {
    _blocSubscription?.cancel();
    try {
      _blocSubscription = event.cartBloc.stream.listen((state) {
        if (state.cart.restaurantId.isNotEmpty) {
          add(StreamRestaurant(state.cart.restaurantId));
        }
      });
      add(StreamRestaurant(event.cartBloc.state.cart.restaurantId));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onRestaurantUpdated(
      _RestaurantUpdated event, Emitter<RestaurantState> emit) {
    return emit(RestaurantLoaded(event.restaurant));
  }

  void _onRestaurantsUpdated(
      _RestaurantsUpdated event, Emitter<RestaurantState> emit) {
    return emit(RestaurantsLoaded(event.restaurants));
  }
}
