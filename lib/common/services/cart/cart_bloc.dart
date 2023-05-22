import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(cartRepository.readCart().isNotEmpty
            ? CartState.notEmpty(cartRepository.readCart())
            : const CartState.empty()) {
    on<UpdateCart>(onUpdateCart);
    on<ClearCart>(onClearCart);
    on<AddPetition>(onAddPetition);
    on<RemovePetition>(onRemovePetition);
    on<IncreaseQuantity>(onIncreaseQuantity);
    on<DecreaseQuantity>(onDecreaseQuantity);
  }

  final CartRepository _cartRepository;

  void onUpdateCart(UpdateCart event, Emitter<CartState> emit) {
    _cartRepository.writeCart(cart: event.cart);
    emit(event.cart.isNotEmpty
        ? CartState.notEmpty(event.cart)
        : const CartState.empty());
  }

  void onClearCart(ClearCart event, Emitter<CartState> emit) {
    return add(const UpdateCart(Cart.empty));
  }

  void onAddPetition(AddPetition event, Emitter<CartState> emit) {
    final petitions = state.cart.petitions;
    petitions.add(Petition(
        foodId: event.foodId,
        restaurantId: event.restaurantId,
        quantity: event.quantity));
    final cart = state.cart.copyWith(petitions: petitions);
    return add(UpdateCart(cart));
  }

  void onRemovePetition(RemovePetition event, Emitter<CartState> emit) {
    final petitions = state.cart.petitions;
    petitions.removeWhere((petition) =>
        petition.foodId == event.foodId &&
        petition.restaurantId == event.restaurantId);
    final cart = state.cart.copyWith(petitions: petitions);
    return add(UpdateCart(cart));
  }

  void onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final cart = state.cart;
    final positionIndex = cart.petitions.indexWhere((petition) =>
        petition.foodId == event.foodId &&
        petition.restaurantId == event.restaurantId);
    final petition = cart.petitions[positionIndex];

    if (petition.quantity >= 10) return;

    final newPetition = petition.copyWith(quantity: petition.quantity + 1);
    final newPetitions = cart.petitions;
    newPetitions[positionIndex] = newPetition;

    return add(UpdateCart(cart.copyWith(petitions: newPetitions)));
  }

  void onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final cart = state.cart;
    final positionIndex = cart.petitions.indexWhere((petition) =>
        petition.foodId == event.foodId &&
        petition.restaurantId == event.restaurantId);
    final petition = cart.petitions[positionIndex];

    if (petition.quantity <= 0) return;

    final newPetition = petition.copyWith(quantity: petition.quantity - 1);
    final newPetitions = cart.petitions;
    newPetitions[positionIndex] = newPetition;

    return add(UpdateCart(cart.copyWith(petitions: newPetitions)));
  }
}
