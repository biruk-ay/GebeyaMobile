
import 'exceptions.dart';
import 'field.dart';

class EmailField extends TextField {
  EmailField({
  required = true,
  validator,
  liveValidate = true,
  emptyAsNull = true,
}) : super(
  required: required,
  validator: validator ?? _emailValidator,
  liveValidate: liveValidate,
  emptyAsNull: emptyAsNull);

  static Future<void> _emailValidator(String? value) async {
    if (value == null || !_isValidEmail(value)) {
    throw ValidationException('Please enter a valid email');
    }
  }

  static bool _isValidEmail(String value) {
    final hasAtSign = value.contains('@');
    final hasDot = value.contains('.');
    return hasAtSign && hasDot;
  }
}
