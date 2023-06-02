import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
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
    on<SetQuantity>(onSetQuantity);
  }

  final CartRepository _cartRepository;

  Future<void> onGetCart(GetCart event, Emitter<CartState> emit) async {
    try {
      final cart = await _cartRepository.getCart();
      add(UpdateCart(cart));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  Future<void> onUpdateCart(UpdateCart event, Emitter<CartState> emit) async {
    try {
      await _cartRepository.setCart(cart: event.cart);
      emit(event.cart.isNotEmpty
          ? CartState.notEmpty(event.cart)
          : const CartState.empty());
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onClearCart(ClearCart event, Emitter<CartState> emit) {
    try {
      add(const UpdateCart(Cart.empty));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onAddPetition(AddPetition event, Emitter<CartState> emit) {
    if (state.cart.restaurantId.isNotEmpty &&
        state.cart.restaurantId != event.restaurantId) return;
    try {
      List<Petition> petitions = List.from(state.cart.petitions);
      petitions.add(Petition(foodId: event.foodId, quantity: event.quantity));
      add(UpdateCart(state.cart
          .copyWith(restaurantId: event.restaurantId, petitions: petitions)));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onRemovePetition(RemovePetition event, Emitter<CartState> emit) {
    try {
      List<Petition> petitions = List.from(state.cart.petitions);
      petitions.removeWhere((petition) => petition.foodId == event.foodId);
      if (petitions.isEmpty) return add(ClearCart());
      add(UpdateCart(state.cart.copyWith(petitions: petitions)));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onIncreaseQuantity(IncreaseQuantity event, Emitter<CartState> emit) {
    try {
      List<Petition> petitions = List.from(state.cart.petitions);
      final index =
          petitions.indexWhere((petition) => petition.foodId == event.foodId);
      if (index == -1) return;
      final petition =
          petitions[index].copyWith(quantity: petitions[index].quantity + 1);
      petitions[index] = petition;
      add(UpdateCart(state.cart.copyWith(petitions: petitions)));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onDecreaseQuantity(DecreaseQuantity event, Emitter<CartState> emit) {
    try {
      List<Petition> petitions = List.from(state.cart.petitions);
      final index =
          petitions.indexWhere((petition) => petition.foodId == event.foodId);
      if (index == -1) return;
      final petition =
          petitions[index].copyWith(quantity: petitions[index].quantity - 1);
      if (petition.quantity <= 0) return;
      petitions[index] = petition;
      add(UpdateCart(state.cart.copyWith(petitions: petitions)));
    } catch (_) {
      emit(const CartState.failure());
    }
  }

  void onSetQuantity(SetQuantity event, Emitter<CartState> emit) {
    try {
      List<Petition> petitions = List.from(state.cart.petitions);
      final index =
          petitions.indexWhere((petition) => petition.foodId == event.foodId);
      if (index == -1) {
        return add(
            AddPetition(event.restaurantId, event.foodId, event.quantity));
      }
      final petition = petitions[index].copyWith(quantity: event.quantity);
      petitions[index] = petition;
      add(UpdateCart(state.cart.copyWith(petitions: petitions)));
    } catch (_) {
      emit(const CartState.failure());
    }
  }
}
