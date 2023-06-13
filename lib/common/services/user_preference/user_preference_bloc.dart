import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:preference_repository/preference_repository.dart';

part 'user_preference_event.dart';
part 'user_preference_state.dart';

class UserPreferenceBloc
    extends Bloc<UserPreferenceEvent, UserPreferenceState> {
  UserPreferenceBloc({PreferenceRepository? preferenceRepository})
      : _preferenceRepository = preferenceRepository ?? PreferenceRepository(),
        super(const UserPreferenceState.loading()) {
    on<GetUserPreference>(onGetUserPreference);
    on<UpdateUserPreference>(onUpdateCart);
    /* on<ClearUserPreference>(onClearCart);
    on<AddPetition>(onAddPetition);
    on<RemovePetition>(onRemovePetition); */
  }

  final PreferenceRepository _preferenceRepository;

  Future<void> onGetUserPreference(
      GetUserPreference event, Emitter<UserPreferenceState> emit) async {
    // final userPreferences = await _preferenceRepository.getUserPreferences();
    final userPreferences = [
      const Preference(
          id: '69H7mpV3tpAhR8aRaNAS',
          displayName: 'Vegetarian',
          description:
              'A vegetarian diet does not include any meat, poultry, or seafood. It is a meal plan made up of foods that come mostly from plants')
    ];

    add(UpdateUserPreference(userPreferences));
  }

  Future<void> onUpdateCart(
      UpdateUserPreference event, Emitter<UserPreferenceState> emit) async {
    // await _preferenceRepository.setUserPreferences(
    //     userPreferences: event.userPreferences);
    emit(event.userPreferences.isNotEmpty
        ? UserPreferenceState.notEmpty(event.userPreferences)
        : const UserPreferenceState.empty());
  }

  /* void onClearCart(ClearCart event, Emitter<CartState> emit) {
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
  } */
}
