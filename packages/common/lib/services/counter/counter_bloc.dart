import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:common/services/cart/cart_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(1) {
    on<IncrementCounter>(onIncrementCounter);
    on<DecrementCounter>(onDecrementCounter);
    on<CartBlocCounter>(onCartBlocCounter);
  }

  void onIncrementCounter(IncrementCounter event, Emitter<int> emit) =>
      emit(state + 1);

  void onDecrementCounter(DecrementCounter event, Emitter<int> emit) {
    if (state - 1 <= 0) return;
    emit(state - 1);
  }

  Future<void> onCartBlocCounter(
      CartBlocCounter event, Emitter<int> emit) async {
    try {
      final cart = event.cartBloc.state.cart;
      final petition = cart.petitions
          .firstWhereOrNull((petition) => petition.foodId == event.foodId);
      if (cart.restaurantId == event.restaurantId && petition != null) {
        emit(petition.quantity);
      }
    } catch (_) {
      return;
    }
  }
}
