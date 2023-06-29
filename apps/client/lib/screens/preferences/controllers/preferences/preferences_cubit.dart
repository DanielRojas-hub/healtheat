import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:food_preference_repository/food_preference_repository.dart';
import 'package:user_preference_repository/user_preference_repository.dart';
import 'package:user_repository/user_repository.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit(this._authenticationRepository,
      {UserRepository? userRepository,
      UserPreferenceRepository? userPreferenceRepository})
      : _userRepository = userRepository ?? UserRepository(),
        _userPreferenceRepository =
            userPreferenceRepository ?? UserPreferenceRepository(),
        super(const PreferencesState());

  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;
  final UserPreferenceRepository _userPreferenceRepository;

  void insertPreference(FoodPreference foodPreference) {
    if (state.foodPreferences.contains(foodPreference)) return;
    final List<FoodPreference> foodPreferences =
        List.from(state.foodPreferences);
    foodPreferences.add(foodPreference);
    emit(state.copyWith(foodPreferences: foodPreferences));
  }

  void removePreference(FoodPreference foodPreference) {
    if (!state.foodPreferences.contains(foodPreference)) return;
    final List<FoodPreference> foodPreferences =
        List.from(state.foodPreferences);
    foodPreferences.remove(foodPreference);
    emit(state.copyWith(foodPreferences: foodPreferences));
  }

  void displayNameChanged(String value) {
    final displayName = NotEmptyString.dirty(value);
    emit(
      state.copyWith(
        displayName: displayName,
        isValid: Formz.validate([displayName]),
      ),
    );
  }

  Future<String> onLogInWithAnonymous() async {
    return (await _authenticationRepository.logInWithAnonymous())!.uid;
  }

  Future<void> onSkip() async {
    final uid = await onLogInWithAnonymous();
    final user = User(id: uid);
    await _userRepository.createUser(user);
  }

  Future<void> onSubmit(User verificationUser) async {
    if (!state.isValid) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      late String uid;
      if (verificationUser.isEmpty) {
        uid = await onLogInWithAnonymous();
      } else {
        uid = verificationUser.id;
      }

      final userPreference = UserPreference(
          displayName: state.displayName.value,
          preferenceIds: List.generate(state.foodPreferences.length,
              (index) => state.foodPreferences[index].id));
      await _userPreferenceRepository.createUserPreference(uid, userPreference);

      final user = User(
        id: uid,
        userPreferenceId: userPreference.id,
      );

      if (verificationUser.isEmpty) {
        await _userRepository.createUser(user);
      } else {
        await _userRepository
            .updateUser(user, {'userPreferenceId': userPreference.id});
      }

      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
