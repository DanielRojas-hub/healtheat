part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object?> get props => [];
}

class AddCategory extends FilterEvent {
  final String categoryId;

  const AddCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class RemoveCategory extends FilterEvent {
  final String categoryId;

  const RemoveCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class AddCuisine extends FilterEvent {
  final String cuisineId;

  const AddCuisine(this.cuisineId);

  @override
  List<Object> get props => [cuisineId];
}

class RemoveCuisine extends FilterEvent {
  final String cuisineId;

  const RemoveCuisine(this.cuisineId);

  @override
  List<Object> get props => [cuisineId];
}

class AddMenu extends FilterEvent {
  final String menuId;

  const AddMenu(this.menuId);

  @override
  List<Object> get props => [menuId];
}

class RemoveMenu extends FilterEvent {
  final String menuId;

  const RemoveMenu(this.menuId);

  @override
  List<Object> get props => [menuId];
}

class AddSortType extends FilterEvent {
  final int sortTypeId;

  const AddSortType(this.sortTypeId);

  @override
  List<Object> get props => [sortTypeId];
}

class RemoveSortType extends FilterEvent {
  final int sortTypeId;

  const RemoveSortType(this.sortTypeId);

  @override
  List<Object> get props => [sortTypeId];
}

class ResetFilter extends FilterEvent {
  const ResetFilter();

  @override
  List<Object> get props => [];
}
