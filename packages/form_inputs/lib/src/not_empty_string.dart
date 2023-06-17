import 'package:formz/formz.dart';

enum NotEmptyStringValidationError { invalid }

class NotEmptyString extends FormzInput<String, NotEmptyStringValidationError> {
  const NotEmptyString.pure() : super.pure('');

  const NotEmptyString.dirty([super.value = '']) : super.dirty();

  // static final RegExp _notEmptyStringRegExp = RegExp(
  //   r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  // );

  @override
  NotEmptyStringValidationError? validator(String? value) {
    if (value == null || value.isEmpty)
      return NotEmptyStringValidationError.invalid;
    return null;
    // return _notEmptyStringRegExp.hasMatch(value ?? '')
    //     ? null
    //     : NotEmptyStringValidationError.invalid;
  }
}
