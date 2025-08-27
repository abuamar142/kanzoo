class AudioExercise {
  final String audioFile;
  final String question;
  final List<String> options;
  final List<int> correctAnswerIndexes;

  const AudioExercise({
    required this.audioFile,
    this.question = '',
    required this.options,
    required this.correctAnswerIndexes,
  });

  bool get requiresMultipleAnswers => correctAnswerIndexes.length > 1;
}
