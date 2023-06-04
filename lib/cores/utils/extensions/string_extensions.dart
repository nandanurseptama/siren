extension StringExtension on String {
  String get upperFirstLetter {
    if (isEmpty) {
      return this;
    }
    return this[0].toUpperCase() + substring(1);
  }

  String get upperFirstLetterInEachWord {
    if (isEmpty) {
      return this;
    }
    var words = split(" ");
    if (words.isEmpty) {
      return this;
    }
    return words.map((e) => e.upperFirstLetter).toList().join(" ");
  }
}
