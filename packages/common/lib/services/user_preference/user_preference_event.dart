// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_preference_bloc.dart';

abstract class UserPreferenceEvent extends Equatable {
  const UserPreferenceEvent();

  @override
  List<Object?> get props => [];
}

class GetUserPreference extends UserPreferenceEvent {
  final String userId;
  final String userPreferenceId;

  const GetUserPreference(this.userId, this.userPreferenceId);

  @override
  List<Object> get props => [userId, userPreferenceId];
}

class GetUserPreferences extends UserPreferenceEvent {
  final String userId;

  const GetUserPreferences(this.userId);

  @override
  List<Object> get props => [userId];
}

class StreamUserPreference extends UserPreferenceEvent {
  final String userId;
  final String? userPreferenceId;

  const StreamUserPreference(this.userId, this.userPreferenceId);

  @override
  List<Object?> get props => [userId, userPreferenceId];
}

class StreamUserPreferences extends UserPreferenceEvent {
  final String userId;

  const StreamUserPreferences(this.userId);

  @override
  List<Object> get props => [userId];
}

class UserBlocUserPreference extends UserPreferenceEvent {
  final UserBloc userBloc;

  const UserBlocUserPreference(this.userBloc);

  @override
  List<Object> get props => [userBloc];
}

class _UserPreferenceUpdated extends UserPreferenceEvent {
  final UserPreference userPreference;

  const _UserPreferenceUpdated(this.userPreference);

  @override
  List<Object> get props => [userPreference];
}

class _UserPreferencesUpdated extends UserPreferenceEvent {
  final List<UserPreference> userPreferences;

  const _UserPreferencesUpdated(this.userPreferences);

  @override
  List<Object> get props => [userPreferences];
}
