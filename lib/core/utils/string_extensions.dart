extension StringExtensions on String {
  /// Capitalize first letter of the string
  /// Example: "hello" -> "Hello"
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }

  /// Capitalize first letter of each word (after spaces)
  /// Example: "hello world" -> "Hello World"
  String capitalizeWords() {
    if (isEmpty) return this;

    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }

  /// Capitalize first letter only, keep the rest as is
  /// Example: "hello WORLD" -> "Hello WORLD"
  String capitalizeFirst() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }

  /// Capitalize first letter of each word, keep the rest as is
  /// Example: "hello WORLD" -> "Hello WORLD"
  String capitalizeWordsFirst() {
    if (isEmpty) return this;

    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1);
        })
        .join(' ');
  }

  /// Remove extra spaces and capitalize words
  /// Example: "  hello   world  " -> "Hello World"
  String capitalizeWordsClean() {
    if (isEmpty) return this;

    return trim()
        .split(RegExp(r'\s+'))
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
