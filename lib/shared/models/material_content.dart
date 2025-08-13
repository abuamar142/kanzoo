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
  final String? subtitle; // optional subtitle under title
  final List<String> paragraphs;
  final List<MaterialVocab> vocab;
  final List<MaterialExample> examples;
  final String? footer; // optional footer note at the end

  const MaterialSection({
    required this.title,
    this.subtitle,
    this.paragraphs = const [],
    this.vocab = const [],
    this.examples = const [],
    this.footer,
  });
}

class MaterialContent {
  final String topicId;
  final List<MaterialSection> sections;

  const MaterialContent({required this.topicId, required this.sections});
}
