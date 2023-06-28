import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:equatable/equatable.dart';
import 'package:restaurant_repository/restaurant_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc({required this.restaurantBloc})
      : super(const SearchState(searchInput: '')) {
    on<InputChange>(_onInputChange);
    on<FilterChange>(_onFilterChange);
    on<UpdateRestaurant>(_onUpdateRestaurant);
    on<RestaurantChange>(_onRestaurantChange);
    _restaurantBlocSubscription = restaurantBloc.stream.listen((state) {
      if (state is RestaurantsLoaded) {
        add(RestaurantChange(originalRestaurants: state.restaurants));
      }
    });
  }

  final RestaurantBloc restaurantBloc;
  late final StreamSubscription? _restaurantBlocSubscription;

  @override
  Future<void> close() {
    _restaurantBlocSubscription?.cancel();
    return super.close();
  }

  void _onInputChange(InputChange event, Emitter<SearchState> emit) async {
    // emit(SearchState(searchInput: event.searchInput));
    add(UpdateRestaurant(state.originalRestaurants, state.categoryIds,
        state.cuisineIds, state.menuIds, event.searchInput));
  }

  void _onFilterChange(FilterChange event, Emitter<SearchState> emit) async {
    add(UpdateRestaurant(state.originalRestaurants, event.categoryIds,
        event.cuisineIds, event.menuIds, state.searchInput));
  }

  void _onRestaurantChange(
      RestaurantChange event, Emitter<SearchState> emit) async {
    add(UpdateRestaurant(event.originalRestaurants, state.categoryIds,
        state.cuisineIds, state.menuIds, state.searchInput));
  }

  void _onUpdateRestaurant(UpdateRestaurant event, Emitter<SearchState> emit) {
    final restaurants = event.originalRestaurants?.where((restaurant) {
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
      if (event.searchInput != null && event.searchInput!.isNotEmpty) {
        validation = validation &&
            restaurant.displayName!
                .toLowerCase()
                .contains(event.searchInput!.toLowerCase());
      }

      return validation;
    }).toList();
    return emit(SearchState(
        categoryIds: event.categoryIds,
        cuisineIds: event.cuisineIds,
        menuIds: event.menuIds,
        searchInput: event.searchInput,
        restaurants: restaurants,
        originalRestaurants: event.originalRestaurants));
  }
}
