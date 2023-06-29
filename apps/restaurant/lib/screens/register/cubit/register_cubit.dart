import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:form_inputs/form_inputs.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());
  final TextEditingController codeController = TextEditingController();
  final TextEditingController openingTimeController = TextEditingController();
  final TextEditingController closingTimeController = TextEditingController();

  void nameChanged(String value) {
    final name = NotEmptyString.dirty(value);
    emit(state.copyWith(
      name: name,
      isValid: Formz.validate([
        name,
        state.address,
        state.code,
        state.phone,
        state.openingTime,
        state.closingTime,
      ]),
    ));
  }

  void addressChanged(String value) {
    final address = NotEmptyString.dirty(value);
    emit(state.copyWith(
      address: address,
      isValid: Formz.validate([
        state.name,
        address,
        state.code,
        state.phone,
        state.openingTime,
        state.closingTime,
      ]),
    ));
  }

  void codeChanged(String value) {
    final code = NotEmptyString.dirty(value);
    codeController.text = value;
    emit(state.copyWith(
      code: code,
      isValid: Formz.validate([
        state.name,
        state.address,
        code,
        state.phone,
        state.openingTime,
        state.closingTime,
      ]),
    ));
  }

  void phoneChanged(String value) {
    final phone = IsNumeric.dirty(value);
    emit(state.copyWith(
      phone: phone,
      isValid: Formz.validate([
        state.name,
        state.address,
        state.code,
        phone,
        state.openingTime,
        state.closingTime,
      ]),
    ));
  }

  void openingTimeChanged(DateTime? value) {
    if (value == null) return;
    final openingTime = NotEmptyString.dirty(value.toString());
    openingTimeController.text = value.toString();
    emit(state.copyWith(
      openingTime: openingTime,
      isValid: Formz.validate([
        state.name,
        state.address,
        state.code,
        state.phone,
        openingTime,
        state.closingTime,
      ]),
    ));
  }

  void closingTimeChanged(DateTime? value) {
    if (value == null) return;
    final closingTime = NotEmptyString.dirty(value.toString());
    closingTimeController.text = value.toString();
    emit(state.copyWith(
      closingTime: closingTime,
      isValid: Formz.validate([
        state.name,
        state.address,
        state.code,
        state.phone,
        state.openingTime,
        closingTime,
      ]),
    ));
  }

  void addCuisine(String cuisineId) {
    final List<String> cuisineIds = List.from(state.cuisineIds);
    cuisineIds.add(cuisineId);
    emit(state.copyWith(cuisineIds: cuisineIds));
  }

  void removeCuisine(String cuisineId) {
    final List<String> cuisineIds = List.from(state.cuisineIds);
    cuisineIds.remove(cuisineId);
    emit(state.copyWith(cuisineIds: cuisineIds));
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

  void imageChanged(File? image) {
    emit(
      state.copyWith(image: image),
    );
  }
}
