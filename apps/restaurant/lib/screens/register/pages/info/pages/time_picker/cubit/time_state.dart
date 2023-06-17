part of 'time_cubit.dart';

final class TimeState extends Equatable {
  final DateTime time;

  const TimeState(this.time);

  @override
  List<Object?> get props => [time];
}

// class TimeInitial extends TimeState {}
