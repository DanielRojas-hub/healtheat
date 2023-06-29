part of 'filter_bloc.dart';

class FilterState extends Equatable {
  FilterState(
      // {required this.cuisineIds,
      // required this.menuIds,
      // required this.sortTypeList,
      // required this.categoryIds});
      {List<String>? cuisineIds,
      List<String>? menuIds,
      List<int>? sortTypeList,
      List<String>? categoryIds})
      : categoryIds = categoryIds ?? List.empty(),
        menuIds = menuIds ?? List.empty(),
        cuisineIds = cuisineIds ?? List.empty(),
        sortTypeList = sortTypeList ?? List.empty();

  final List<String> categoryIds;
  final List<String> cuisineIds;
  final List<String> menuIds;
  final List<int> sortTypeList;

  FilterState copyWith(
      {List<String>? categoryIds,
      List<String>? cuisineIds,
      List<String>? menuIds,
      List<int>? sortTypeList}) {
    return FilterState(
      categoryIds: categoryIds ?? this.categoryIds,
      cuisineIds: cuisineIds ?? this.cuisineIds,
      menuIds: menuIds ?? this.menuIds,
      sortTypeList: sortTypeList ?? this.sortTypeList,
    );
  }

  @override
  List<Object?> get props => [categoryIds, cuisineIds, menuIds, sortTypeList];
}
