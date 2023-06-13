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
}