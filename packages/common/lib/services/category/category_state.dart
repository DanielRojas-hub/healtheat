part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final Category category;

  const CategoryLoaded(this.category);

  @override
  List<Object> get props => [category];
}

class CategoriesLoaded extends CategoryState {
  final List<Category> categories;

  const CategoriesLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}
