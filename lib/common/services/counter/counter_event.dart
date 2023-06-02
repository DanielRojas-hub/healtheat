part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class IncrementCounter extends CounterEvent {}

class DecrementCounter extends CounterEvent {}

class CartBlocCounter extends CounterEvent {
  final CartBloc cartBloc;
  final String restaurantId;
  final String foodId;

  const CartBlocCounter(this.cartBloc, this.restaurantId, this.foodId);

  @override
  List<Object> get props => [];
}
