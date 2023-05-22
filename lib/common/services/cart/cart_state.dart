part of 'cart_bloc.dart';

enum CartStatus {
  empty,
  notEmpty,
}

class CartState extends Equatable {
  const CartState._({required this.status, this.cart = Cart.empty});

  final CartStatus status;
  final Cart cart;

  const CartState.notEmpty(Cart cart)
      : this._(
          status: CartStatus.notEmpty,
          cart: cart,
        );

  const CartState.empty() : this._(status: CartStatus.empty);

  @override
  List<Object> get props => [status, cart];
}
