part of 'shift_cubit.dart';

class ShiftState extends Equatable {
  const ShiftState({required this.selectedShift});

  final Shift selectedShift;

  @override
  List<Object> get props => [selectedShift];
}
