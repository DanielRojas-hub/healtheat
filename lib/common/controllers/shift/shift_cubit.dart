import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:healtheat/common/widgets/shift_widget.dart';

part 'shift_state.dart';

class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit({required List<Shift> shiftList, PageController? controller})
      : _shiftList = shiftList,
        controller = controller ?? PageController(initialPage: 0),
        super(ShiftState(selectedShift: shiftList.first));

  final List<Shift> _shiftList;
  final PageController controller;

  void changeSelectedShift({required Shift selectedShift}) {
    // controller.animateToPage();
    emit(ShiftState(selectedShift: selectedShift));
  }
}
