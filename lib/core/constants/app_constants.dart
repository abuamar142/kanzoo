class AppConstants {
  // App Information
  static const String appName = 'Kanzoo';
  static const String appVersion = '1.0.0';
  static const String appDescription =
      'Aplikasi Pembelajaran Bahasa Arab untuk MTs';

  // School Information
  static const String schoolName = 'MTsN 14 Jombang';
  static const String teacherName = 'Moch. Fikri Jauhar Maulana S. Pd.';

  // Storage Keys
  static const String userProgressKey = 'user_progress';
  static const String completedChaptersKey = 'completed_chapters';
  static const String userScoresKey = 'user_scores';

  // Asset Paths
  static const String logoPath = 'assets/images/logos/app_logo.svg';

  // Login Page Text
  static const String welcomeText = 'Selamat Datang di';
  static const String appDescriptionLogin = 'Aplikasi Pembelajaran Bahasa Arab';
  static const String nameLabel = 'Nama';
  static const String nameKey = 'name';
  static const String namePlaceholder = 'Masukkan nama';
  static const String classLabel = 'Kelas';
  static const String classKey = 'class';
  static const String classPlaceholder = 'Pilih kelas';
  static const String classPickerTitle = 'Pilih Kelas';
  static const String loginButtonText = 'Masuk';

  // Validation Messages
  static const String nameEmptyError = 'Nama tidak boleh kosong';
  static const String nameMinLengthError = 'Nama minimal 2 karakter';
  static const String classEmptyError = 'Pilih kelas terlebih dahulu';
  static const int nameMinLength = 2;

  // Success Messages
  static const String loginSuccessMessage = 'Selamat datang';
  static const String successTitle = 'Berhasil';
  static const String errorTitle = 'Error';
  static const String infoTitle = 'Info';
  static const String warningTitle = 'Peringatan';

  // Available Classes
  static const List<String> availableClasses = [
    '7A',
    '7B',
    '7C',
    '7D',
    '7E',
    '7F',
  ];

  // Home Page Text
  static const String greetingArabic = 'Assalamu\'alaikum';
  static const String welcomeHomeMessage =
      'Selamat datang di aplikasi pembelajaran bahasa Arab. Mari mulai belajar hari ini!';
  static const String mainMenuTitle = 'Menu Utama';
  static const String materialsTitle = 'Materi';
  static const String materialsSubtitle = 'Pelajari bahasa Arab';
  static const String exerciseTitle = 'Latihan';
  static const String exerciseSubtitle = 'Kerjakan soal';
  static const String exercisesListTitle = 'Daftar Soal';
  static const String exercisesAllLabel = 'Lihat Semua Soal';
  static const String exerciseStartLabel = 'Mulai';
  static const String exerciseDetailPending = 'Detail soal akan segera hadir';
  static const String comingSoonMessage = 'akan segera hadir!';
  static const String logoutMenuText = 'Keluar';
  static const String classPrefix = 'Kelas';
  static const String defaultUserName = 'Siswa';

  // Drawer Text
  static const String drawerHeaderTitle = appName;
  static const String drawerMaterials = 'Daftar Materi';
  static const String drawerExercises = 'Daftar Soal';
  static const String drawerDictionary = 'Kamus';
  static const String drawerAbout = 'Tentang Aplikasi';
  static const String aboutDialogTitle = 'Tentang';
  static const String dictionaryDialogTitle = 'Kamus';

  // Dictionary
  static const String dictionarySearchHint = 'Cari kata (IDN/Arab)';
  static const String dictionaryNoResults = 'Tidak ada hasil';
  static const String dictionarySortLabel = 'Urutkan';
  static const String dictionarySortDefault = 'Default';
  static const String dictionarySortByIndonesian = 'Abjad Indonesia';
  static const String dictionarySortByArabic = 'Abjad Arab';
  static const String dictionarySectionIntroduction = 'Perkenalan';
  static const String dictionarySectionDemonstratives = 'Kata Tunjuk';

  // Materials Sections
  static const String materialsSectionIntro = 'Pengantar';
  static const String materialsSectionVocabulary = 'Kosakata';
  static const String materialsSectionExamples = 'Contoh Kalimat';
  static const String materialsSectionNotes = 'Catatan';

  // Error Messages
  static const String networkError = 'Tidak ada koneksi internet';
  static const String generalError = 'Terjadi kesalahan, silakan coba lagi';
  static const String dataNotFound = 'Data tidak ditemukan';
  static const String saveDataError = 'Gagal menyimpan data';
}
