part of 'preferences_cubit.dart';

final class PreferencesState extends Equatable {
  const PreferencesState({
    this.foodPreferences = const [],
    this.displayName = const NotEmptyString.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.isValid = false,
    this.errorMessage,
  });

  final List<FoodPreference> foodPreferences;
  final NotEmptyString displayName;
  final FormzSubmissionStatus status;
  final bool isValid;
  final String? errorMessage;

  @override
  List<Object?> get props => [
        foodPreferences,
        displayName,
        status,
        isValid,
        errorMessage,
      ];

  PreferencesState copyWith({
    List<FoodPreference>? foodPreferences,
    NotEmptyString? displayName,
    FormzSubmissionStatus? status,
    bool? isValid,
    String? errorMessage,
  }) {
    return PreferencesState(
      foodPreferences: foodPreferences ?? this.foodPreferences,
      displayName: displayName ?? this.displayName,
      status: status ?? this.status,
      isValid: isValid ?? this.isValid,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
