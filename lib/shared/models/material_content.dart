enum MaterialSectionType { one, two, three, four, five }

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

class MaterialScrambleItem {
  final List<String> tokens;
  final int? underlineIndex; // optional index to underline a token (e.g., preposition)

  const MaterialScrambleItem({required this.tokens, this.underlineIndex});
}

class MaterialGroupQuestion {
  final String question;
  final List<String> subItems;

  const MaterialGroupQuestion({required this.question, this.subItems = const []});
}

class MaterialSection {
  final String title;
  final String? subtitle; // optional subtitle under title
  final List<String> paragraphs;
  final List<MaterialVocab> vocab;
  final List<MaterialExample> examples;
  final String? footer; // optional footer note at the end
  final MaterialSectionType? type; // explicit section template selector
  final List<MaterialScrambleItem> scrambleItems;
  final List<MaterialGroupQuestion> groupQuestions;

  const MaterialSection({
    required this.title,
    this.subtitle,
    this.paragraphs = const [],
    this.vocab = const [],
    this.examples = const [],
    this.footer,
    this.type,
    this.scrambleItems = const [],
    this.groupQuestions = const [],
  });
}

class MaterialContent {
  final String topicId;
  final List<MaterialSection> sections;
  final String? kind; // e.g., 'qiroah', 'kitabah'
  final int? chapter; // e.g., 1,2,3

  const MaterialContent({
    required this.topicId,
    required this.sections,
    this.kind,
    this.chapter,
  });
}
