import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({CategoryRepository? categoryRepository})
      : _categoryRepository = categoryRepository ?? CategoryRepository(),
        super(CategoryLoading()) {
    on<StreamCategory>(_onStreamCategory);
    on<GetCategory>(_onGetCategory);
    on<StreamCategories>(_onStreamCategories);
    on<GetCategories>(_onGetCategories);
    on<_CategoryUpdated>(_onCategoryUpdated);
    on<_CategoriesUpdated>(_onCategoriesUpdated);
  }

  final CategoryRepository _categoryRepository;

  StreamSubscription? _categorySubscription;

  @override
  Future<void> close() {
    _categorySubscription?.cancel();
    return super.close();
  }

  void _onStreamCategory(StreamCategory event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    try {
      // if (event.categoryId.isEmpty) return;
      _categorySubscription = _categoryRepository
          .streamCategory(event.categoryId)
          .listen((category) => add(_CategoryUpdated(category)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetCategory(
      GetCategory event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    try {
      add(_CategoryUpdated(
          await _categoryRepository.getCategory(event.categoryId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamCategories(
      StreamCategories event, Emitter<CategoryState> emit) {
    _categorySubscription?.cancel();
    try {
      _categorySubscription = _categoryRepository
          .streamCategories()
          .listen((categories) => add(_CategoriesUpdated(categories)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetCategories(
      GetCategories event, Emitter<CategoryState> emit) async {
    _categorySubscription?.cancel();
    try {
      // if (event.restaurantId.isEmpty) return emit(const FoodsLoaded([]));
      add(_CategoriesUpdated(
        await _categoryRepository.getCategories(),
      ));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onCategoryUpdated(_CategoryUpdated event, Emitter<CategoryState> emit) {
    return emit(CategoryLoaded(event.category));
  }

  void _onCategoriesUpdated(
      _CategoriesUpdated event, Emitter<CategoryState> emit) {
    return emit(CategoriesLoaded(event.categories));
  }
}
