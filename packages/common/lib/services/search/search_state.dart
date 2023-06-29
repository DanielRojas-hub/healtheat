part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String? searchInput;
  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;
  final List<Restaurant>? restaurants;
  final List<Restaurant>? originalRestaurants;

  const SearchState(
      {this.originalRestaurants,
      this.searchInput,
      this.categoryIds,
      this.cuisineIds,
      this.menuIds,
      this.restaurants});

  SearchState copyWith({
    List<String>? categoryIds,
    List<String>? cuisineIds,
    List<String>? menuIds,
    String? searchInput,
    List<Restaurant>? restaurants,
    List<Restaurant>? originalRestaurants,
  }) {
    return SearchState(
      categoryIds: categoryIds ?? this.categoryIds,
      cuisineIds: cuisineIds ?? this.cuisineIds,
      menuIds: menuIds ?? this.menuIds,
      searchInput: searchInput ?? this.searchInput,
      restaurants: restaurants ?? this.restaurants,
      originalRestaurants: originalRestaurants ?? this.originalRestaurants,
    );
  }

  @override
  List<Object?> get props => [
        searchInput,
        categoryIds,
        cuisineIds,
        menuIds,
        restaurants,
        originalRestaurants
      ];
}
