part of 'preference_bloc.dart';

abstract class PreferenceEvent extends Equatable {
  const PreferenceEvent();

  @override
  List<Object?> get props => [];
}

class StreamPreference extends PreferenceEvent {
  final String preferenceId;

  const StreamPreference(this.preferenceId);

  @override
  List<Object> get props => [preferenceId];
}

class GetPreference extends PreferenceEvent {
  final String preferenceId;

  const GetPreference(this.preferenceId);

  @override
  List<Object> get props => [preferenceId];
}

class StreamPreferences extends PreferenceEvent {
  final List<String>? preferenceIds;
  final List<String>? categoryPreferenceIds;

  const StreamPreferences({this.preferenceIds, this.categoryPreferenceIds});

  @override
  List<Object?> get props => [preferenceIds, categoryPreferenceIds];
}

class GetPreferences extends PreferenceEvent {
  final List<String>? preferenceIds;
  final List<String>? categoryPreferenceIds;

  const GetPreferences({this.preferenceIds, this.categoryPreferenceIds});

  @override
  List<Object?> get props => [preferenceIds, categoryPreferenceIds];
}

class _PreferenceUpdated extends PreferenceEvent {
  final Preference preference;

  const _PreferenceUpdated(this.preference);

  @override
  List<Object> get props => [preference];
}

class _PreferencesUpdated extends PreferenceEvent {
  final List<Preference> preferences;

  const _PreferencesUpdated(this.preferences);

  @override
  List<Object> get props => [preferences];
}
