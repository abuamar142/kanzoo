class DictionaryEntry {
  final String arabic;
  final String indonesian;
  final String section; // e.g., Perkenalan, Kata Tunjuk

  const DictionaryEntry({
    required this.arabic,
    required this.indonesian,
    required this.section,
  });
}

enum DictionarySort { defaultOrder, indonesian, arabic }
