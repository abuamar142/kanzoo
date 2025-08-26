class AudioExercise {
  final String audioFile;
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const AudioExercise({
    required this.audioFile,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}
