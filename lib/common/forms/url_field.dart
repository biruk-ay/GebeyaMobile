import 'dart:core';
import 'exceptions.dart';
import 'field.dart';


class URLField extends TextField {
  URLField({
    required = true,
    validator,
    liveValidate = true,
    emptyAsNull = true,
  }) : super(
    required: required,
    validator: validator ?? _urlValidator,
    liveValidate: liveValidate,
    emptyAsNull: emptyAsNull
  );

  static Future<void> _urlValidator(String? value) async {
    if (value == null || !_isValidUrl(value)) {
      throw ValidationException('Please enter a valid URL');
    }
  }

  static bool _isValidUrl(String value) {
    final Uri? uri = Uri.tryParse(value);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }
}
