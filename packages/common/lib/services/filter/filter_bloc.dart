import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(const FilterState()) {
    on<AddCategory>(onAddCategory);
    on<RemoveCategory>(onRemoveCategory);
    on<AddCuisine>(onAddCuisine);
    on<RemoveCuisine>(onRemoveCuisine);
    on<AddMenu>(onAddMenu);
    on<RemoveMenu>(onRemoveMenu);
    on<AddSortType>(onAddSortType);
    on<RemoveSortType>(onRemoveSortType);
  }

  // final PreferenceRepository _preferenceRepository;

  void onAddCategory(AddCategory event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.categoryList);
    copyList.add(event.categoryId);
    emit(state.copyWith(categoryList: copyList));
  }

  void onRemoveCategory(RemoveCategory event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.categoryList);
    copyList.remove(event.categoryId);
    emit(state.copyWith(categoryList: copyList));
  }

  void onAddCuisine(AddCuisine event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.cuisineList);
    copyList.add(event.cuisineId);
    emit(state.copyWith(cuisineList: copyList));
  }

  void onRemoveCuisine(RemoveCuisine event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.cuisineList);
    copyList.remove(event.cuisineId);
    emit(state.copyWith(cuisineList: copyList));
  }

  void onAddMenu(AddMenu event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.menuList);
    copyList.add(event.menuId);
    emit(state.copyWith(menuList: copyList));
  }

  void onRemoveMenu(RemoveMenu event, Emitter<FilterState> emit) async {
    final copyList = List<String>.from(state.menuList);
    copyList.remove(event.menuId);
    emit(state.copyWith(menuList: copyList));
  }

  void onAddSortType(AddSortType event, Emitter<FilterState> emit) async {
    final copyList = List<int>.from(state.sortTypeList);
    copyList.add(event.sortTypeId);
    emit(state.copyWith(sortTypeList: copyList));
  }

  void onRemoveSortType(RemoveSortType event, Emitter<FilterState> emit) async {
    final copyList = List<int>.from(state.sortTypeList);
    copyList.remove(event.sortTypeId);
    emit(state.copyWith(sortTypeList: copyList));
  }
}
