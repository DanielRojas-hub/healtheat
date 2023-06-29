part of 'food_preference_bloc.dart';

abstract class FoodPreferenceEvent extends Equatable {
  const FoodPreferenceEvent();

  @override
  List<Object?> get props => [];
}

class StreamFoodPreference extends FoodPreferenceEvent {
  final String foodPreferenceId;

  const StreamFoodPreference(this.foodPreferenceId);

  @override
  List<Object> get props => [foodPreferenceId];
}

class GetFoodPreference extends FoodPreferenceEvent {
  final String foodPreferenceId;

  const GetFoodPreference(this.foodPreferenceId);

  @override
  List<Object> get props => [foodPreferenceId];
}

class StreamFoodPreferences extends FoodPreferenceEvent {
  const StreamFoodPreferences();

  // final List<String>? foodPreferenceIds;
  // final List<String>? categoryPreferenceIds;

  // const StreamPreferences({this.foodPreferenceIds, this.categoryPreferenceIds});

  // @override
  // List<Object?> get props => [foodPreferenceIds, categoryPreferenceIds];
}

class GetFoodPreferences extends FoodPreferenceEvent {
  const GetFoodPreferences();

  // final List<String>? foodPreferenceIds;
  // final List<String>? categoryPreferenceIds;

  // const GetPreferences({this.foodPreferenceIds, this.categoryPreferenceIds});

  // @override
  // List<Object?> get props => [foodPreferenceIds, categoryPreferenceIds];
}

class _FoodPreferenceUpdated extends FoodPreferenceEvent {
  final FoodPreference foodPreference;

  const _FoodPreferenceUpdated(this.foodPreference);

  @override
  List<Object> get props => [foodPreference];
}

class _FoodPreferencesUpdated extends FoodPreferenceEvent {
  final List<FoodPreference> foodPreference;

  const _FoodPreferencesUpdated(this.foodPreference);

  @override
  List<Object> get props => [foodPreference];
}
