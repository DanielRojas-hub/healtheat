import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:food_repository/food_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';

part 'add_food_state.dart';

class AddFoodCubit extends Cubit<AddFoodState> {
  AddFoodCubit() : super(const AddFoodState());
  // final FoodRepository foodRepository;
  void clearCubit() {
    emit(const AddFoodState(isRestarting: true));
    Future.delayed(const Duration(seconds: 3), () {
      emit(const AddFoodState(isRestarting: false));
    });
  }

  void nameChanged(String value) {
    final displayName = NotEmptyString.dirty(value);
    emit(
      state.copyWith(
        displayName: displayName,
        isValid: Formz.validate([
          displayName,
          state.description,
          state.price,
        ]),
      ),
    );
  }

  void descriptionChanged(String value) {
    final description = NotEmptyString.dirty(value);
    emit(
      state.copyWith(
        description: description,
        isValid: Formz.validate([
          description,
          state.displayName,
          state.price,
        ]),
      ),
    );
  }

  void priceChanged(String value) {
    final price = IsNumeric.dirty(value);
    emit(
      state.copyWith(
        price: price,
        isValid: Formz.validate([
          price,
          state.description,
          state.displayName,
        ]),
      ),
    );
  }

  void imageChanged(File? image) {
    emit(
      state.copyWith(image: image),
    );
  }

  void addMenu(String menuId) {
    final List<String> menuIds = List.from(state.menuIds);
    menuIds.add(menuId);
    emit(state.copyWith(menuIds: menuIds));
  }

  void removeMenu(String menuId) {
    final List<String> menuIds = List.from(state.menuIds);
    menuIds.remove(menuId);
    emit(state.copyWith(menuIds: menuIds));
  }

  void addCategory(String categoryId) {
    final List<String> categoryIds = List.from(state.categoryIds);
    categoryIds.add(categoryId);
    emit(state.copyWith(categoryIds: categoryIds));
  }

  void removeCategory(String categoryId) {
    final List<String> categoryIds = List.from(state.categoryIds);
    categoryIds.remove(categoryId);
    emit(state.copyWith(categoryIds: categoryIds));
  }

  void addPreference(String preferenceId) {
    final List<String> preferenceIds = List.from(state.preferenceIds);
    preferenceIds.add(preferenceId);
    emit(state.copyWith(preferenceIds: preferenceIds));
  }

  void removePreference(String preferenceId) {
    final List<String> preferenceIds = List.from(state.preferenceIds);
    preferenceIds.remove(preferenceId);
    emit(state.copyWith(preferenceIds: preferenceIds));
  }
}
