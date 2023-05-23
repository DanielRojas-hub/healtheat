// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_preference_bloc.dart';

abstract class UserPreferenceEvent extends Equatable {
  const UserPreferenceEvent();

  @override
  List<Object?> get props => [];
}

class GetUserPreference extends UserPreferenceEvent {}

class UpdateUserPreference extends UserPreferenceEvent {
  final List<Preference> userPreferences;

  const UpdateUserPreference(this.userPreferences);

  @override
  List<Object> get props => [userPreferences];
}

/* class ClearUserPreference extends UserPreferenceEvent {}

 class AddPetition extends UserPreferenceEvent {
  final String restaurantId;
  final String foodId;
  final int quantity;

  const AddPetition(this.restaurantId, this.foodId, this.quantity);

  @override
  List<Object> get props => [restaurantId, foodId, quantity];
}

class RemovePetition extends UserPreferenceEvent {
  final String foodId;

  const RemovePetition(this.foodId);

  @override
  List<Object> get props => [foodId];
}
 */