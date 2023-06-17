import 'package:formz/formz.dart';

enum NotEmptyTimeValidationError { invalid }

class NotEmptyTime extends FormzInput<DateTime, NotEmptyTimeValidationError> {
  NotEmptyTime.pure() : super.pure(DateTime.now());

  NotEmptyTime.dirty(DateTime value) : super.dirty(value);

  @override
  NotEmptyTimeValidationError? validator(DateTime? value) {
    if (value == null) {
      return NotEmptyTimeValidationError.invalid;
    }
    return null;
  }
}
