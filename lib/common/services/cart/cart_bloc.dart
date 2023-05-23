import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc({required CartRepository cartRepository})
      : _cartRepository = cartRepository,
        super(const CartState.loading()) {
    on<GetCart>(onGetCart);
    on<UpdateCart>(onUpdateCart);
    on<ClearCart>(onClearCart);
    on<AddPetition>(onAddPetition);
    on<RemovePetition>(onRemovePetition);
    on<IncreaseQuantity>(onIncreaseQuantity);
    on<DecreaseQuantity>(onDecreaseQuantity);
  }

  final CartRepository _cartRepository;

  Future<void> onGetCart(GetCart event, Emitter<CartState> emit) async {
    final cart = await _cartRepository.getCart();
    add(UpdateCart(cart));
  }

  Future<void> onUpdateCart(UpdateCart event, Emitter<CartState> emit) async {
    await _cartRepository.setCart(cart: event.cart);
    emit(event.cart.isNotEmpty
        ? CartState.notEmpty(event.cart)
        : const CartState.empty());
  }

  void onClearCart(ClearCart event, Emitter<CartState> emit) {
    return add(const UpdateCart(Cart.empty));
  }

  void onAddPetition(AddPetition event, Emitter<CartState> emit) {
    if (state.cart.restaurantId != '' &&
        state.cart.restaurantId != event.restaurantId) return;
    List<Petition> petitions = List.from(state.cart.petitions);
    if (petitions
            .firstWhereOrNull((petition) => petition.foodId == event.foodId) !=
        null) {
      return add(IncreaseQuantity(event.foodId, quantity: event.quantity));
    }
    petitions.add(Petition(foodId: event.foodId, quantity: event.quantity));
    final cart = state.cart
        .copyWith(restaurantId: event.restaurantId, petitions: petitions);
    return add(UpdateCart(cart));
  }

  void onRemovePetition(RemovePetition event, Emitter<CartState> emit) {
    List<Petition> petitions = List.from(state.cart.petitions);
    petitions.removeWhere((petition) => petition.foodId == event.foodId);
    if (petitions.isEmpty) return add(ClearCart());
    final cart = state.cart.copyWith(petitions: petitions);
    return add(UpdateCart(cart));
  }

  void onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    final cart = state.cart;
    final positionIndex = cart.petitions
        .indexWhere((petition) => petition.foodId == event.foodId);
    final petition = cart.petitions[positionIndex];
    final newPetition =
        petition.copyWith(quantity: petition.quantity + (event.quantity ?? 1));
    List<Petition> newPetitions = List.from(cart.petitions);
    newPetitions[positionIndex] = newPetition;

    return add(UpdateCart(cart.copyWith(petitions: newPetitions)));
  }

  void onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    final cart = state.cart;
    final positionIndex = cart.petitions
        .indexWhere((petition) => petition.foodId == event.foodId);
    final petition = cart.petitions[positionIndex];

    if (petition.quantity - 1 <= 0) return;

    final newPetition = petition.copyWith(quantity: petition.quantity - 1);
    List<Petition> newPetitions = List.from(cart.petitions);
    newPetitions[positionIndex] = newPetition;

    return add(UpdateCart(cart.copyWith(petitions: newPetitions)));
  }
}
