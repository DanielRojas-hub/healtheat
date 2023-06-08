part of 'preference_bloc.dart';

abstract class PreferenceState extends Equatable {
  const PreferenceState();

  @override
  List<Object> get props => [];
}

class PreferenceLoading extends PreferenceState {}

class PreferenceFailure extends PreferenceState {}

class PreferenceLoaded extends PreferenceState {
  final Preference preference;

  const PreferenceLoaded(this.preference);

  @override
  List<Object> get props => [preference];
}

class PreferencesLoaded extends PreferenceState {
  final List<Preference> preferences;

  const PreferencesLoaded(this.preferences);

  @override
  List<Object> get props => [preferences];
}
