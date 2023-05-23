import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:preference_repository/preference_repository.dart';

part 'preference_event.dart';
part 'preference_state.dart';

class PreferenceBloc extends Bloc<PreferenceEvent, PreferenceState> {
  PreferenceBloc({PreferenceRepository? preferenceRepository})
      : _preferenceRepository = preferenceRepository ?? PreferenceRepository(),
        super(PreferenceLoading()) {
    on<StreamPreference>(_onStreamPreference);
    on<GetPreference>(_onGetPreference);
    on<StreamPreferences>(_onStreamPreferences);
    on<GetPreferences>(_onGetPreferences);
    on<_PreferenceUpdated>(_onPreferenceUpdated);
    on<_PreferencesUpdated>(_onPreferencesUpdated);
  }

  final PreferenceRepository _preferenceRepository;

  StreamSubscription? _preferenceSubscription;

  @override
  Future<void> close() {
    _preferenceSubscription?.cancel();
    return super.close();
  }

  void _onStreamPreference(
      StreamPreference event, Emitter<PreferenceState> emit) {
    _preferenceSubscription?.cancel();
    try {
      _preferenceSubscription = _preferenceRepository
          .streamPreference(event.preferenceId)
          .listen((preference) => add(_PreferenceUpdated(preference)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetPreference(
      GetPreference event, Emitter<PreferenceState> emit) async {
    _preferenceSubscription?.cancel();
    try {
      add(_PreferenceUpdated(
          await _preferenceRepository.getPreference(event.preferenceId)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onStreamPreferences(
      StreamPreferences event, Emitter<PreferenceState> emit) {
    _preferenceSubscription?.cancel();
    try {
      _preferenceSubscription = _preferenceRepository
          .streamPreferences(preferenceIds: event.preferenceIds)
          .listen((preferences) => add(_PreferencesUpdated(preferences)));
    } catch (_) {
      //TODO: catch
    }
  }

  Future<void> _onGetPreferences(
      GetPreferences event, Emitter<PreferenceState> emit) async {
    _preferenceSubscription?.cancel();
    try {
      add(_PreferencesUpdated(await _preferenceRepository.getPreferences(
          preferenceIds: event.preferenceIds)));
    } catch (_) {
      //TODO: catch
    }
  }

  void _onPreferenceUpdated(
      _PreferenceUpdated event, Emitter<PreferenceState> emit) {
    return emit(PreferenceLoaded(event.preference));
  }

  void _onPreferencesUpdated(
      _PreferencesUpdated event, Emitter<PreferenceState> emit) {
    return emit(PreferencesLoaded(event.preferences));
  }
}
