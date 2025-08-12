class MaterialExample {
  final String arabic;
  final String translation;

  const MaterialExample({required this.arabic, required this.translation});
}

class MaterialVocab {
  final String arabic;
  final String indonesian;
  final String? note;

  const MaterialVocab({
    required this.arabic,
    required this.indonesian,
    this.note,
  });
}

class MaterialSection {
  final String title;
  final List<String> paragraphs;
  final List<MaterialVocab> vocab;
  final List<MaterialExample> examples;

  const MaterialSection({
    required this.title,
    this.paragraphs = const [],
    this.vocab = const [],
    this.examples = const [],
  });
}

class MaterialContent {
  final String topicId;
  final List<MaterialSection> sections;

  const MaterialContent({required this.topicId, required this.sections});
}

