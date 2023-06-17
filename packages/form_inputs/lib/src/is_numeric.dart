import 'package:formz/formz.dart';

/// Validation errors for the [Email] [FormzInput].
enum IsNumericValidationError {
  /// Generic invalid error.
  invalid
}

/// {@template email}
/// Form input for an email input.
/// {@endtemplate}
class IsNumeric extends FormzInput<String, IsNumericValidationError> {
  /// {@macro email}
  const IsNumeric.pure() : super.pure('');

  /// {@macro email}
  const IsNumeric.dirty([super.value = '']) : super.dirty();

  static final RegExp _isNumericRegExp = RegExp(r'^\d+$');

  @override
  IsNumericValidationError? validator(String? value) {
    return _isNumericRegExp.hasMatch(value ?? '')
        ? null
        : IsNumericValidationError.invalid;
  }
}
