part of 'user_preference_bloc.dart';

abstract class UserPreferenceState extends Equatable {
  const UserPreferenceState();

  @override
  List<Object> get props => [];
}

class UserPreferenceLoading extends UserPreferenceState {}

class UserPreferenceFailure extends UserPreferenceState {}

class UserPreferenceLoaded extends UserPreferenceState {
  final UserPreference userPreference;

  const UserPreferenceLoaded(this.userPreference);

  @override
  List<Object> get props => [userPreference];
}

class UserPreferencesLoaded extends UserPreferenceState {
  final List<UserPreference> userPreferences;

  const UserPreferencesLoaded(this.userPreferences);

  @override
  List<Object> get props => [userPreferences];
}
