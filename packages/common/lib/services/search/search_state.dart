part of 'search_bloc.dart';

class SearchState extends Equatable {
  final String? searchInput;
  final List<String>? categoryIds;
  final List<String>? cuisineIds;
  final List<String>? menuIds;
  const SearchState(
      {this.searchInput, this.categoryIds, this.cuisineIds, this.menuIds});

  SearchState copyWith({
    List<String>? categoryIds,
    List<String>? cuisineIds,
    List<String>? menuIds,
    String? searchInput,
  }) {
    return SearchState(
      categoryIds: categoryIds ?? this.categoryIds,
      cuisineIds: cuisineIds ?? this.cuisineIds,
      menuIds: menuIds ?? this.menuIds,
      searchInput: searchInput ?? this.searchInput,
    );
  }

  @override
  List<Object?> get props => [
        searchInput,
        categoryIds,
        cuisineIds,
        menuIds,
      ];
}
