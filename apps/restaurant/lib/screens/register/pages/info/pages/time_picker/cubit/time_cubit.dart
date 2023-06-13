import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_state.dart';

class TimeCubit extends Cubit<TimeState> {
  TimeCubit({String? initTime})
      : super(TimeState(
            initTime == null ? DateTime.now() : DateTime.parse(initTime)));

  void timeChanged(DateTime time) => emit(TimeState(time));
}
