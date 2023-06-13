part of 'user_preference_bloc.dart';

enum UserPreferenceStatus {
  empty,
  notEmpty,
  loading,
}

class UserPreferenceState extends Equatable {
  const UserPreferenceState._(
      {required this.status, this.userPreferences = const []});

  final UserPreferenceStatus status;
  final List<Preference> userPreferences;

  const UserPreferenceState.notEmpty(List<Preference> userPreferences)
      : this._(
          status: UserPreferenceStatus.notEmpty,
          userPreferences: userPreferences,
        );

  const UserPreferenceState.empty()
      : this._(status: UserPreferenceStatus.empty);

  const UserPreferenceState.loading()
      : this._(status: UserPreferenceStatus.loading);

  @override
  List<Object> get props => [status, userPreferences];
}
