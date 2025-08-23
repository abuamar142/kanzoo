class AppTiming {
  // Animation Durations (in milliseconds)
  static const int animationDuration = 300;
  static const int fastAnimation = 150;
  static const int slowAnimation = 500;

  // Splash Screen
  static const int splashDuration = 7000; // 7 seconds

  // Exercise/Quiz Timing (in seconds)
  static const int defaultTimeLimit = 300; // 5 minutes
  static const int shortTimeLimit = 180; // 3 minutes
  static const int longTimeLimit = 600; // 10 minutes

  // Auto-save intervals
  static const int autoSaveInterval = 30000; // 30 seconds in milliseconds

  // Debounce delays
  static const int searchDebounce = 500;
  static const int inputDebounce = 300;

  // Snackbar durations
  static const Duration snackbarDuration = Duration(
    milliseconds: 3000,
  ); // 3 seconds
  static const Duration snackbarDurationShort = Duration(
    milliseconds: 2000,
  ); // 2 seconds
  static const Duration snackbarDurationLong = Duration(
    milliseconds: 4000,
  ); // 4 seconds

  // Timeout durations
  static const int networkTimeout = 10000; // 10 seconds
  static const int cacheTimeout = 300000; // 5 minutes
}
