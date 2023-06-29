import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_preference_repository/food_preference_repository.dart';

part 'food_preference_event.dart';
part 'food_preference_state.dart';

class FoodPreferenceBloc
    extends Bloc<FoodPreferenceEvent, FoodPreferenceState> {
  FoodPreferenceBloc({FoodPreferenceRepository? foodPreferenceRepository})
      : _foodPreferenceRepository =
            foodPreferenceRepository ?? FoodPreferenceRepository(),
        super(FoodPreferenceLoading()) {
    on<StreamFoodPreference>(_onStreamFoodPreference);
    on<GetFoodPreference>(_onGetFoodPreference);
    on<StreamFoodPreferences>(_onStreamFoodPreferences);
    on<GetFoodPreferences>(_onGetFoodPreferences);
    on<_FoodPreferenceUpdated>(_onFoodPreferenceUpdated);
    on<_FoodPreferencesUpdated>(_onFoodPreferencesUpdated);
  }

  final FoodPreferenceRepository _foodPreferenceRepository;

  StreamSubscription? _foodPreferenceSubscription;

  @override
  Future<void> close() {
    _foodPreferenceSubscription?.cancel();
    return super.close();
  }

  void _onStreamFoodPreference(
      StreamFoodPreference event, Emitter<FoodPreferenceState> emit) {
    _foodPreferenceSubscription?.cancel();
    try {
      _foodPreferenceSubscription = _foodPreferenceRepository
          .streamFoodPreference(event.foodPreferenceId)
          .listen(
              (foodPreference) => add(_FoodPreferenceUpdated(foodPreference)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetFoodPreference(
      GetFoodPreference event, Emitter<FoodPreferenceState> emit) async {
    _foodPreferenceSubscription?.cancel();
    try {
      add(_FoodPreferenceUpdated(await _foodPreferenceRepository
          .getFoodPreference(event.foodPreferenceId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamFoodPreferences(
      StreamFoodPreferences event, Emitter<FoodPreferenceState> emit) {
    _foodPreferenceSubscription?.cancel();
    try {
      _foodPreferenceSubscription = _foodPreferenceRepository
          .streamFoodPreferences()
          .listen((foodPreferences) =>
              add(_FoodPreferencesUpdated(foodPreferences)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetFoodPreferences(
      GetFoodPreferences event, Emitter<FoodPreferenceState> emit) async {
    _foodPreferenceSubscription?.cancel();
    try {
      add(_FoodPreferencesUpdated(
          await _foodPreferenceRepository.getFoodPreferences()));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onFoodPreferenceUpdated(
      _FoodPreferenceUpdated event, Emitter<FoodPreferenceState> emit) {
    return emit(FoodPreferenceLoaded(event.foodPreference));
  }

  void _onFoodPreferencesUpdated(
      _FoodPreferencesUpdated event, Emitter<FoodPreferenceState> emit) {
    return emit(FoodPreferencesLoaded(event.foodPreference));
  }
}
