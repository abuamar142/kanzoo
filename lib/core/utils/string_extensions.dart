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

    // Extended Arabic range including Arabic digits, punctuation, and additional symbols
    final arabicChars = RegExp(
      r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
    ).allMatches(this).length;
    final totalChars = replaceAll(
      RegExp(r'\s+'),
      '',
    ).length; // Remove spaces for counting

    // If text contains Arabic question numbers, treat as Arabic
    if (hasArabicQuestionNumbers) {
      return true;
    }

    // If text starts with Arabic characters, treat as Arabic
    if (trim().isNotEmpty &&
        RegExp(
          r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF\uFB50-\uFDFF\uFE70-\uFEFF]',
        ).hasMatch(trim()[0])) {
      return true;
    }

    return totalChars > 0 &&
        (arabicChars / totalChars) > 0.3; // Lowered threshold to 30%
  }

  /// Check if string contains Arabic question numbers (١, ٢, ٣, etc.)
  bool get hasArabicQuestionNumbers {
    return RegExp(r'[١٢٣٤٥٦٧٨٩٠]').hasMatch(this);
  }
}
