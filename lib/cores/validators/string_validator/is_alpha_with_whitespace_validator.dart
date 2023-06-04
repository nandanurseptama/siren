import 'package:siren/cores/validators/string_validator/string_validator.dart';

import 'alpha.dart';
import 'package:siren/cores/validators/validator.dart';

// validate string alphabet with white space
String? isAlphaWithWhiteSpaceValidator({
  required String fieldName,
  String? value,
  String? errorMessage,
  String locale = 'en-US',
}) {
  String? isNotEmpty =
      StringValidator.isNotEmpty(fieldName: fieldName, value: value);
  if (isNotEmpty != null) {
    return isNotEmpty;
  }
  String v = value!.replaceAll(" ", "").toUpperCase();
  RegExp r = RegExp(getAlpha(locale));
  String defaultErrorMessage = "$fieldName value is not alphabet";

  if (!r.hasMatch(v)) {
    return Validator.error(
        defaultErrorMessage: defaultErrorMessage,
        customErrorMessage: errorMessage);
  }
  return null;
}
