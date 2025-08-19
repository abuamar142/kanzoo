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
  static const String materialFontSizeKey = 'material_font_size';

  // Reading preferences
  static const double materialFontSizeDefault = 14.0; // aligns with bodyMedium
  static const double materialFontSizeMin = 8.0;
  static const double materialFontSizeMax = 32.0;

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
  static const String greeting = 'Halo';
  static const String welcomeHomeMessage =
      'Selamat datang di aplikasi pembelajaran bahasa Arab. Mari mulai belajar hari ini!';
  static const String mainMenuTitle = 'Menu Utama';
  static const String materialsTitle = 'Materi';
  static const String comingSoonMessage = 'akan segera hadir!';
  static const String logoutMenuText = 'Keluar';
  static const String classPrefix = 'Kelas';
  static const String defaultUserName = 'Siswa';

  // Drawer Text
  static const String drawerHeaderTitle = appName;
  static const String drawerAbout = 'Tentang Aplikasi';
  static const String aboutDialogTitle = 'Tentang';
  static const String mufrodatDialogTitle = 'Mufrodat';
  static const String drawerMufrodat = 'Mufrodat';

  // Dictionary
  static const String dictionarySearchHint = 'Cari kata';
  static const String dictionaryNoResults = 'Tidak ada hasil';
  static const String dictionarySortLabel = 'Urutkan';
  static const String dictionarySortDefault = 'Default';
  static const String dictionarySortByIndonesian = 'Abjad Indonesia';
  static const String dictionarySortByArabic = 'Abjad Arab';
  static const String dictionarySectionIntroduction = 'Perkenalan';
  static const String dictionarySectionDemonstratives = 'Kata Tunjuk';
  static const String dictionarySectionMufrodat = 'Mufrodat';

  // Splash
  static const String mahfudzotTodayTitle = 'Mahfudzot Hari Ini';

  // Material Types Labels
  static const String qiroahLabel = "Qiro'ah";
  static const String kitabahLabel = 'Kitabah';
  static const String mahfudzotLabel = 'Mahfudzot';
  static const String qowaidLabel = "Qowa'id";
  static const String istimaLabel = "Istima'";
  static const String kalamLabel = 'Kalam';
  static const String mufrodatLabel = 'Mufrodat';

  // Material Instructions
  static const String listenInstruction =
      'Dengarkan bunyi kata/kalimat Arab berikut, kemudian cocokkan dengan jawaban yang tersedia dan tulis jawaban yang sesuai!';
  static const String completeInstruction =
      'Lengkapilah kalimat di bawah ini sesuai dengan audio yang didengar!';
  static const String practiceInstruction =
      'Praktikkanlah percakapan berikut di depan kelas dengan temanmu. Kemudian Ganti nama dengan namamu sendiri.';
  static const String makeSentenceInstruction =
      'Buatlah kalimat sederhana menggunakan kosakata di bawah ini!';

  // Font Size
  static const String fontSizeLabel = 'Ukuran Teks';

  // Error Messages
  static const String generalError = 'Terjadi kesalahan, silakan coba lagi';
  static const String saveDataError = 'Gagal menyimpan data';
}
