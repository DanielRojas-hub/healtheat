part of 'cart_bloc.dart';

enum CartStatus {
  notEmpty,
  empty,
  loading,
  failure,
}

class CartState extends Equatable {
  const CartState._(this.status, {this.cart = Cart.empty});

  final CartStatus status;
  final Cart cart;

  const CartState.notEmpty(Cart cart) : this._(CartStatus.notEmpty, cart: cart);

  const CartState.empty() : this._(CartStatus.empty);

  const CartState.loading() : this._(CartStatus.loading);

  const CartState.failure() : this._(CartStatus.failure);

  @override
  List<Object?> get props => [status, cart];
}
