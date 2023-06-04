import 'package:siren/cores/validators/string_validator/is_alpha_with_whitespace_validator.dart';

import 'is_alpha_validator.dart';
import 'package:siren/cores/validators/validator.dart';

class StringValidator {
  static String? isNotEmpty({
    required String fieldName,
    String? value,
    String? errorMessage,
  }) {
    String defaultErrorMessage = "$fieldName cannot be empty";
    if (value == null) {
      return Validator.error(
          defaultErrorMessage: defaultErrorMessage,
          customErrorMessage: errorMessage);
    }
    if (value.isEmpty) {
      return Validator.error(
          defaultErrorMessage: defaultErrorMessage,
          customErrorMessage: errorMessage);
    }
    return null;
  }

  static String? isEmpty({
    required String fieldName,
    String? value,
    String? errorMessage,
  }) {
    String defaultErrorMessage = "$fieldName must be empty";
    if (StringValidator.isNotEmpty(
            fieldName: fieldName, value: value, errorMessage: errorMessage) ==
        null) {
      return Validator.error(
          defaultErrorMessage: defaultErrorMessage,
          customErrorMessage: errorMessage);
    }
    return null;
  }

  static String? isAlpha({
    required String fieldName,
    required String value,
    String? errorMessage,
    String locale = 'en-US',
  }) {
    return isAlphaValidator(
        fieldName: fieldName,
        value: value,
        locale: locale,
        errorMessage: errorMessage);
  }

  static String? isAlphaWithWhiteSpace({
    required String fieldName,
    String? value,
    String? errorMessage,
    String locale = 'en-US',
  }) {
    return isAlphaWithWhiteSpaceValidator(
        fieldName: fieldName,
        value: value,
        errorMessage: errorMessage,
        locale: locale
    );
  }
}
