class AppExercise {
  // Attempt Limits
  static const int maxAttempts = 3;
  static const int defaultAttempts = 1;
  static const int unlimitedAttempts = -1;

  // Scoring
  static const double passingScore = 70.0;
  static const double perfectScore = 100.0;
  static const double minimumScore = 0.0;

  // Question Types
  static const String multipleChoice = 'multiple_choice';
  static const String fillInTheBlank = 'fill_in_blank';
  static const String matching = 'matching';
  static const String trueOrFalse = 'true_false';

  // Difficulty Levels
  static const String easy = 'easy';
  static const String medium = 'medium';
  static const String hard = 'hard';

  // Exercise Status
  static const String notStarted = 'not_started';
  static const String inProgress = 'in_progress';
  static const String completed = 'completed';
  static const String passed = 'passed';
  static const String failed = 'failed';
}
