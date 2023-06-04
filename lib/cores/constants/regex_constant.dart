class RegexConstant {
  static RegExp emailRegex = RegExp(
      r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
  static RegExp onlyAlphabetAndSpaceBetweenWordRegex =
      RegExp(r"^[a-zA-z]+([\s][a-zA-Z]+)*$");
}
