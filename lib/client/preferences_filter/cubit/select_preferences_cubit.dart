import 'package:bloc/bloc.dart';
import 'package:preference_repository/preference_repository.dart';

class SelectPreferencesCubit extends Cubit<List<Preference>> {
  SelectPreferencesCubit() : super([]);

  void insertPreference(Preference preference) {
    if (state.contains(preference)) return;
    final List<Preference> preferences = List.from(state);
    preferences.add(preference);
    emit(preferences);
  }

  void removePreference(Preference preference) {
    if (!state.contains(preference)) return;
    final List<Preference> preferences = List.from(state);
    preferences.remove(preference);
    emit(preferences);
  }
}
