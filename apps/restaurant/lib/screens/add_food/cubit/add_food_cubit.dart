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
}
