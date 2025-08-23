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

  // Arabic text detection methods

  /// Check if the string contains Arabic characters
  bool get isArabic {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(this);
  }

  /// Check if the string contains Arabic numbers
  bool get hasArabicNumbers {
    return RegExp(r'[\u0660-\u0669]').hasMatch(this);
  }

  /// Check if the string is primarily Arabic text (more than 50% Arabic characters)
  bool get isPrimarilyArabic {
    if (isEmpty) return false;

    final arabicChars = RegExp(r'[\u0600-\u06FF]').allMatches(this).length;
    final totalChars = replaceAll(
      RegExp(r'\s+'),
      '',
    ).length; // Remove spaces for counting

    return totalChars > 0 && (arabicChars / totalChars) > 0.5;
  }

  /// Check if string contains Arabic question numbers (١, ٢, ٣, etc.)
  bool get hasArabicQuestionNumbers {
    return RegExp(r'[١٢٣٤٥٦٧٨٩٠]').hasMatch(this);
  }
}
