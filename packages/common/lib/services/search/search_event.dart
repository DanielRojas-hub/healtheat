part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

class InputChange extends SearchEvent {
  final String searchInput;

  const InputChange(this.searchInput);

  @override
  List<Object> get props => [searchInput];
}

class FilterChange extends SearchEvent {
  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;

  const FilterChange({this.categoryIds, this.cuisineIds, this.menuIds});

  @override
  List<Object?> get props => [categoryIds, menuIds, cuisineIds];
}

class RestaurantChange extends SearchEvent {
  final List<Restaurant> originalRestaurants;

  const RestaurantChange({required this.originalRestaurants});

  @override
  List<Object> get props => [originalRestaurants];
}

class UpdateRestaurant extends SearchEvent {
  final List<Restaurant>? originalRestaurants;
  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;
  final String? searchInput;

  const UpdateRestaurant(this.originalRestaurants, this.categoryIds,
      this.cuisineIds, this.menuIds, this.searchInput);

  @override
  List<Object?> get props =>
      [originalRestaurants, categoryIds, menuIds, cuisineIds, searchInput];
}
