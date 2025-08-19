enum MaterialSectionType {
  one,
  two,
  three,
  four,
  five,
  table,
  audio,
  audioPaired,
  dialog,
  exerciseTable,
  interactiveQuiz,
}

class MaterialRichTextSpan {
  final String text;
  final bool isHighlighted;
  final String?
  color; // Color name from AppColors, e.g., 'primary', 'secondary', 'accent'

  const MaterialRichTextSpan({
    required this.text,
    this.isHighlighted = false,
    this.color,
  });
}

class MaterialRichText {
  final List<MaterialRichTextSpan> spans;

  const MaterialRichText({required this.spans});

  // Helper constructor for simple text
  factory MaterialRichText.simple(String text) {
    return MaterialRichText(spans: [MaterialRichTextSpan(text: text)]);
  }

  // Convert to plain string for backward compatibility
  String toPlainText() {
    return spans.map((span) => span.text).join();
  }
}

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
  final int?
  underlineIndex; // optional index to underline a token (e.g., preposition)

  const MaterialScrambleItem({required this.tokens, this.underlineIndex});
}

class MaterialGroupQuestion {
  final String question;
  final List<String> subItems;

  const MaterialGroupQuestion({
    required this.question,
    this.subItems = const [],
  });
}

class MaterialTableData {
  final List<String>? headers;
  final List<List<String>> rows;

  const MaterialTableData({this.headers, required this.rows});
}

class MaterialDialogLine {
  final String speaker;
  final String text;

  const MaterialDialogLine({required this.speaker, required this.text});
}

class MaterialAudioData {
  final List<String> instructions;
  final List<String>? audioFiles;
  final List<String>? questions;

  const MaterialAudioData({
    this.instructions = const [],
    this.audioFiles,
    this.questions,
  });
}

class MaterialExerciseTableItem {
  final String question;
  final List<List<String>> options;

  const MaterialExerciseTableItem({
    required this.question,
    required this.options,
  });
}

class MaterialExerciseTableData {
  final List<String> instructions;
  final List<MaterialExerciseTableItem> exercises;

  const MaterialExerciseTableData({
    this.instructions = const [],
    required this.exercises,
  });
}

class MaterialQuizOption {
  final String text;
  final bool isCorrect;
  final String? explanation;

  const MaterialQuizOption({
    required this.text,
    required this.isCorrect,
    this.explanation,
  });
}

class MaterialQuizQuestion {
  final String question;
  final List<MaterialQuizOption> options;
  final String? explanation;
  final String? hint;

  const MaterialQuizQuestion({
    required this.question,
    required this.options,
    this.explanation,
    this.hint,
  });
}

class MaterialInteractiveQuizData {
  final List<String> instructions;
  final List<MaterialQuizQuestion> questions;
  final String? completionMessage;
  final bool showScoreAtEnd;

  const MaterialInteractiveQuizData({
    this.instructions = const [],
    required this.questions,
    this.completionMessage,
    this.showScoreAtEnd = true,
  });
}

class MaterialSection {
  final String title;
  final String? subtitle; // optional subtitle under title
  final MaterialRichText? richSubtitle; // Rich text subtitle with colors
  final List<String> paragraphs;
  final List<MaterialVocab> vocab;
  final List<MaterialExample> examples;
  final String? footer; // optional footer note at the end
  final MaterialSectionType? type; // explicit section template selector
  final List<MaterialScrambleItem> scrambleItems;
  final List<MaterialGroupQuestion> groupQuestions;
  final MaterialTableData? tableData;
  final List<MaterialDialogLine> dialogLines;
  final MaterialAudioData? audioData;
  final MaterialExerciseTableData? exerciseTableData;
  final MaterialInteractiveQuizData? interactiveQuizData;

  const MaterialSection({
    required this.title,
    this.subtitle,
    this.richSubtitle,
    this.paragraphs = const [],
    this.vocab = const [],
    this.examples = const [],
    this.footer,
    this.type,
    this.scrambleItems = const [],
    this.groupQuestions = const [],
    this.tableData,
    this.dialogLines = const [],
    this.audioData,
    this.exerciseTableData,
    this.interactiveQuizData,
  });

  // Helper method to get the effective subtitle
  String? getPlainSubtitle() {
    if (richSubtitle != null) return richSubtitle!.toPlainText();
    return subtitle;
  }
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
