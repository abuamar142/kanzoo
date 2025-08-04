class AppConstants {
  // App Information
  static const String appName = 'Kanzoo';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Aplikasi Pembelajaran Bahasa Arab untuk MTs';

  // School Information
  static const String schoolName = 'MTsN 12 Jombang';
  static const String teacherName = 'Moch. Fikri Jauhar Maulana S. Ag., M. Ag.';

  // Timing
  static const int splashDuration = 2000; // 2 seconds in milliseconds
  static const int animationDuration =
      300; // Animation duration in milliseconds

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double extraLargePadding = 32.0;

  static const double defaultRadius = 8.0;
  static const double smallRadius = 4.0;
  static const double largeRadius = 16.0;

  // Exercise Constants
  static const int defaultTimeLimit = 300; // 5 minutes in seconds
  static const int maxAttempts = 3;
  static const double passingScore = 70.0;

  // Storage Keys
  static const String userProgressKey = 'user_progress';
  static const String completedChaptersKey = 'completed_chapters';
  static const String userScoresKey = 'user_scores';

  // Asset Paths
  static const String logoPath = 'assets/images/logos/app_logo.svg';

  // Error Messages
  static const String networkError = 'Tidak ada koneksi internet';
  static const String generalError = 'Terjadi kesalahan, silakan coba lagi';
  static const String dataNotFound = 'Data tidak ditemukan';
}
