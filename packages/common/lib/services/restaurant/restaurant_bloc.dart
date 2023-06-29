import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/services/cart/cart_bloc.dart';
import 'package:common/services/user_preference/user_preference_bloc.dart';
import 'package:equatable/equatable.dart';
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
    on<UserPreferenceBlocRestaurants>(_onUserPreferenceBlocRestaurants);
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
            preferenceIds: event.preferenceIds,
          )
          .listen((restaurants) => add(_RestaurantsUpdated(restaurants,
              categoryIds: event.categoryIds,
              cuisineIds: event.cuisineIds,
              menuIds: event.menuIds)));
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
        preferenceIds: event.preferenceIds,
      )));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onCartBlocRestaurant(
      CartBlocRestaurant event, Emitter<RestaurantState> emit) {
    _blocSubscription?.cancel();
    try {
      final cartBloc = event.cartBloc;
      _blocSubscription = cartBloc.stream.listen((state) {
        if (state.cart.isNotEmpty) {
          add(StreamRestaurant(state.cart.restaurantId));
        }
      });
      if (cartBloc.state.cart.isNotEmpty) {
        add(StreamRestaurant(cartBloc.state.cart.restaurantId));
      }
    } catch (_) {
      //TODO: catch
    }
  }

  void _onUserPreferenceBlocRestaurants(
      UserPreferenceBlocRestaurants event, Emitter<RestaurantState> emit) {
    _blocSubscription?.cancel();
    try {
      _blocSubscription = event.userPreferenceBloc.stream.listen((state) {
        if (state is UserPreferenceLoaded) {
          return add(StreamRestaurants(
              preferenceIds: List.generate(
                  state.userPreference.preferenceIds.length,
                  (index) => state.userPreference.preferenceIds[index]),
              categoryIds: event.categories,
              cuisineIds: event.cuisines,
              menuIds: event.menus));
        }
        add(StreamRestaurants(
            categoryIds: event.categories,
            cuisineIds: event.cuisines,
            menuIds: event.menus));
      });
      if (state is UserPreferenceLoaded) {
        final userPreference =
            (event.userPreferenceBloc.state as UserPreferenceLoaded)
                .userPreference;
        return add(StreamRestaurants(
            preferenceIds: List.generate(userPreference.preferenceIds.length,
                (index) => userPreference.preferenceIds[index]),
            categoryIds: event.categories,
            cuisineIds: event.cuisines,
            menuIds: event.menus));
      }
      add(StreamRestaurants(
          categoryIds: event.categories,
          cuisineIds: event.cuisines,
          menuIds: event.menus));
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
    final restaurants = event.restaurants.where((restaurant) {
      bool validation = true;

      if (event.categoryIds != null && event.categoryIds!.isNotEmpty) {
        validation = validation &&
            restaurant.categoryIds!
                .any((categoryId) => event.categoryIds!.contains(categoryId));
      }
      if (event.cuisineIds != null && event.cuisineIds!.isNotEmpty) {
        validation = validation &&
            restaurant.cuisineIds!
                .any((cuisineId) => event.cuisineIds!.contains(cuisineId));
      }
      if (event.menuIds != null && event.menuIds!.isNotEmpty) {
        validation = validation &&
            restaurant.menuIds!
                .any((menuId) => event.menuIds!.contains(menuId));
      }

      return validation;
    }).toList();
    return emit(RestaurantsLoaded(restaurants));
  }
}
