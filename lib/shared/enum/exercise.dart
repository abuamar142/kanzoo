enum Exercise {
  matching('matching', 'Mendengar dan Mencocokkan'),
  completion('completion', 'Melengkapi Kalimat'),
  scramble('scramble', 'Menyusun Kalimat');

  const Exercise(this.id, this.title);

  final String id;
  final String title;

  static Exercise? findById(String id) {
    for (final type in Exercise.values) {
      if (type.id == id) return type;
    }
    return null;
  }

  static Exercise getById(String id) {
    final type = findById(id);
    if (type == null) {
      throw ArgumentError('Exercise with id "$id" not found');
    }
    return type;
  }

  static List<Exercise> get all => Exercise.values;
  static List<String> get allIds => Exercise.values.map((e) => e.id).toList();

  /// Returns true if this exercise type is audio-based
  bool get isAudioExercise => this == matching || this == completion;

  /// Returns true if this exercise type requires text manipulation
  bool get isTextExercise => this == scramble;

  /// Returns true if this exercise type has multiple choice answers
  bool get hasMultipleChoice => this == matching;

  /// Returns true if this exercise type requires filling in blanks
  bool get requiresCompletion => this == completion;

  /// Returns true if this exercise type requires arranging elements
  bool get requiresArrangement => this == scramble;
}
