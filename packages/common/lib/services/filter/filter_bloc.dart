import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc(
      {List<String>? categoryIds,
      List<String>? cuisineIds,
      List<String>? menuIds})
      : super(FilterState(
            categoryIds: categoryIds,
            cuisineIds: cuisineIds,
            menuIds: menuIds)) {
    on<AddCategory>(onAddCategory);
    on<RemoveCategory>(onRemoveCategory);
    on<AddCuisine>(onAddCuisine);
    on<RemoveCuisine>(onRemoveCuisine);
    on<AddMenu>(onAddMenu);
    on<RemoveMenu>(onRemoveMenu);
    on<AddSortType>(onAddSortType);
    on<RemoveSortType>(onRemoveSortType);
    on<ResetFilter>(_onResetFilter);
  }

  // final PreferenceRepository _preferenceRepository;

  void onAddCategory(AddCategory event, Emitter<FilterState> emit) async {
    if (state.categoryIds.isEmpty) {
      return emit(state.copyWith(categoryIds: [event.categoryId]));
    }

    final copyList = List<String>.from(state.categoryIds);
    copyList.add(event.categoryId);
    emit(state.copyWith(categoryIds: copyList));
  }

  void onRemoveCategory(RemoveCategory event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.categoryIds);
    copyList.remove(event.categoryId);
    emit(state.copyWith(categoryIds: copyList));
  }

  void onAddCuisine(AddCuisine event, Emitter<FilterState> emit) async {
    if (state.cuisineIds.isEmpty) {
      return emit(state.copyWith(cuisineIds: [event.cuisineId]));
    }
    final copyList = List<String>.from(state.cuisineIds);
    copyList.add(event.cuisineId);
    emit(state.copyWith(cuisineIds: copyList));
  }

  void onRemoveCuisine(RemoveCuisine event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.cuisineIds);
    copyList.remove(event.cuisineId);
    emit(state.copyWith(cuisineIds: copyList));
  }

  void onAddMenu(AddMenu event, Emitter<FilterState> emit) async {
    if (state.menuIds.isEmpty) {
      return emit(state.copyWith(menuIds: [event.menuId]));
    }

    final copyList = List<String>.from(state.menuIds);
    copyList.add(event.menuId);
    emit(state.copyWith(menuIds: copyList));
  }

  void onRemoveMenu(RemoveMenu event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.menuIds);
    copyList.remove(event.menuId);
    emit(state.copyWith(menuIds: copyList));
  }

  void onAddSortType(AddSortType event, Emitter<FilterState> emit) async {
    if (state.sortTypeList.isEmpty) {
      return emit(state.copyWith(sortTypeList: [event.sortTypeId]));
    }
    final copyList = List<int>.from(state.sortTypeList);
    copyList.add(event.sortTypeId);
    emit(state.copyWith(sortTypeList: copyList));
  }

  void onRemoveSortType(RemoveSortType event, Emitter<FilterState> emit) async {
    final copyList = List<int>.from(state.sortTypeList);
    copyList.remove(event.sortTypeId);
    emit(state.copyWith(sortTypeList: copyList));
  }

  void _onResetFilter(ResetFilter event, Emitter<FilterState> emit) async {
    emit(FilterState());
  }
}
