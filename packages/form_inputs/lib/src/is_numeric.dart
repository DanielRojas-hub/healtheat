import 'package:formz/formz.dart';

enum IsNumericValidationError { invalid }

class IsNumeric extends FormzInput<String, IsNumericValidationError> {
  const IsNumeric.pure() : super.pure('');

  const IsNumeric.dirty([super.value = '']) : super.dirty();

  static final RegExp _isNumericRegExp = RegExp(r'^\d+$');

  @override
  IsNumericValidationError? validator(String? value) {
    return _isNumericRegExp.hasMatch(value ?? '')
        ? null
        : IsNumericValidationError.invalid;
  }
}
