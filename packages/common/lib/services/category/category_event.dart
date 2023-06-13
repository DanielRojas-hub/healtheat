part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object?> get props => [];
}

class StreamCategory extends CategoryEvent {
  final String categoryId;

  const StreamCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class GetCategory extends CategoryEvent {
  final String categoryId;

  const GetCategory(this.categoryId);

  @override
  List<Object> get props => [categoryId];
}

class StreamCategories extends CategoryEvent {
  const StreamCategories();

  @override
  List<Object?> get props => [];
}

class GetCategories extends CategoryEvent {
  const GetCategories();

  @override
  List<Object?> get props => [];
}

class _CategoryUpdated extends CategoryEvent {
  final Category category;

  const _CategoryUpdated(this.category);

  @override
  List<Object> get props => [category];
}

class _CategoriesUpdated extends CategoryEvent {
  final List<Category> categories;

  const _CategoriesUpdated(this.categories);

  @override
  List<Object> get props => [categories];
}
