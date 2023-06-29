part of 'food_preference_bloc.dart';

abstract class FoodPreferenceState extends Equatable {
  const FoodPreferenceState();

  @override
  List<Object> get props => [];
}

class FoodPreferenceLoading extends FoodPreferenceState {}

class FoodPreferenceFailure extends FoodPreferenceState {}

class FoodPreferenceLoaded extends FoodPreferenceState {
  final FoodPreference foodPreference;

  const FoodPreferenceLoaded(this.foodPreference);

  @override
  List<Object> get props => [foodPreference];
}

class FoodPreferencesLoaded extends FoodPreferenceState {
  final List<FoodPreference> foodPreferences;

  const FoodPreferencesLoaded(this.foodPreferences);

  @override
  List<Object> get props => [foodPreferences];
}
