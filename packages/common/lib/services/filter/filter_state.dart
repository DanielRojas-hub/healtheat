part of 'filter_bloc.dart';

class FilterState extends Equatable {
  FilterState(
      // {required this.cuisineList,
      // required this.menuList,
      // required this.sortTypeList,
      // required this.categoryList});
      {List<String>? cuisineList,
      List<String>? menuList,
      List<int>? sortTypeList,
      List<String>? categoryList})
      : categoryList = categoryList ?? List.empty(),
        menuList = menuList ?? List.empty(),
        cuisineList = cuisineList ?? List.empty(),
        sortTypeList = sortTypeList ?? List.empty();

  final List<String> categoryList;
  final List<String> cuisineList;
  final List<String> menuList;
  final List<int> sortTypeList;

  FilterState copyWith(
      {List<String>? categoryList,
      List<String>? cuisineList,
      List<String>? menuList,
      List<int>? sortTypeList}) {
    return FilterState(
      categoryList: categoryList ?? this.categoryList,
      cuisineList: cuisineList ?? this.cuisineList,
      menuList: menuList ?? this.menuList,
      sortTypeList: sortTypeList ?? this.sortTypeList,
    );
  }

  @override
  List<Object?> get props =>
      [categoryList, cuisineList, menuList, sortTypeList];
}
