// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class UpdateCart extends CartEvent {
  final Cart cart;

  const UpdateCart(this.cart);

  @override
  List<Object> get props => [cart];
}

class ClearCart extends CartEvent {}

class AddPetition extends CartEvent {
  final String restaurantId;
  final String foodId;
  final int quantity;

  const AddPetition(this.restaurantId, this.foodId, this.quantity);

  @override
  List<Object> get props => [restaurantId, foodId, quantity];
}

class RemovePetition extends CartEvent {
  final String foodId;

  const RemovePetition(this.foodId);

  @override
  List<Object> get props => [foodId];
}

class IncreaseQuantity extends CartEvent {
  final String foodId;
  final int? quantity;

  const IncreaseQuantity(this.foodId, {this.quantity});

  @override
  List<Object?> get props => [foodId, quantity];
}

class DecreaseQuantity extends CartEvent {
  final String foodId;

  const DecreaseQuantity(this.foodId);

  @override
  List<Object> get props => [foodId];
}
