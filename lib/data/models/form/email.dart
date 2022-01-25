import 'package:formz/formz.dart';

enum EmailValidatorError { invalid }

class Email extends FormzInput<String, EmailValidatorError> {
  Email.pure([String value = '']) : super.pure(value);
  Email.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidatorError? validator(String? value) {
    return _emailRegex.hasMatch(value ?? '')
        ? null
        : EmailValidatorError.invalid;
  }
}
