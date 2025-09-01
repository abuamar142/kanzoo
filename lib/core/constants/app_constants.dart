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
  static const String drawerResetData = 'Reset Data';
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
  static const String sumatifLabel = 'Sumatif';

  // Material Instructions
  static const String listenInstruction =
      'Dengarkan bunyi kata/kalimat Arab berikut, kemudian cocokkan dengan jawaban yang tersedia dan tulis jawaban yang sesuai!';
  static const String completeInstruction =
      'Lengkapilah kalimat di bawah ini sesuai dengan audio yang didengar!';
  static const String practiceInstruction =
      'Praktikkanlah percakapan berikut di depan kelas dengan temanmu. Kemudian Ganti nama dengan namamu sendiri.';
  static const String makeSentenceInstruction =
      'Buatlah kalimat sederhana menggunakan kosakata di bawah ini!';

  // Istima Instructions
  static const String listenAndMatchInstruction =
      'Dengarkan audio berikut dan pilih jawaban yang sesuai!';
  static const String listenAndCompleteInstruction =
      'Dengarkan audio dan lengkapi kalimat yang kosong!';

  // Answer Feedback
  static const String correctAnswerText = 'Jawaban Benar!';
  static const String wrongAnswerText = 'Jawaban Salah!';

  // Font Size
  static const String fontSizeLabel = 'Ukuran Teks';

  // Error Messages
  static const String generalError = 'Terjadi kesalahan, silakan coba lagi';
  static const String saveDataError = 'Gagal menyimpan data';
  static const String cannotOpenLinkError = 'Tidak dapat membuka tautan';
  static const String linkOpenError = 'Gagal membuka tautan';

  // External Link Messages
  static const String externalLinkNotice =
      'Tautan akan dibuka di browser eksternal';

  // Exercise and Quiz Messages
  static const String correctArrangement = 'Susunan benar!';
  static const String incorrectArrangement = 'Susunan salah, coba lagi!';
  static const String checkAnswerButtonText = 'Periksa Jawaban';
  static const String resetButtonText = 'Ulangi';
  static const String answersSavedText = 'Jawaban telah disimpan';
  static const String tapToArrangeText = 'Ketuk untuk menyusun kalimat';
  static const String alreadyCorrectText = 'Sudah benar';

  // Reset Data Page
  static const String resetDataPageTitle = 'Reset Data';
  static const String resetDataDescription =
      'Hapus data kemajuan belajar untuk memulai dari awal';
  static const String resetBab1KitabahTitle = 'Reset Bab 1 - Kitabah';
  static const String resetBab1KitabahDescription =
      'Hapus semua kemajuan soal pada Bab 1 Kitabah';
  static const String resetBab2KitabahTitle = 'Reset Bab 2 - Kitabah';
  static const String resetBab2KitabahDescription =
      'Hapus semua kemajuan soal pada Bab 2 Kitabah';
  static const String resetBab1IstimaTitle = 'Reset Bab 1 - Istima';
  static const String resetBab1IstimaDescription =
      'Hapus semua kemajuan latihan mendengar pada Bab 1';
  static const String resetBab2IstimaTitle = 'Reset Bab 2 - Istima';
  static const String resetBab2IstimaDescription =
      'Hapus semua kemajuan latihan mendengar pada Bab 2';
  static const String resetBab3IstimaTitle = 'Reset Bab 3 - Istima';
  static const String resetBab3IstimaDescription =
      'Hapus semua kemajuan latihan mendengar pada Bab 3';
  static const String resetAllIstimaTitle = 'Reset Semua Istima';
  static const String resetAllIstimaDescription =
      'Hapus semua kemajuan latihan mendengar dari semua bab';
  static const String resetAllExercisesTitle = 'Reset Semua Latihan';
  static const String resetAllExercisesDescription =
      'Hapus semua kemajuan latihan (Istima, Kitabah, dll)';
  static const String resetAllDataTitle = 'Reset Semua Data';
  static const String resetAllDataDescription =
      'Hapus semua kemajuan pembelajaran';

  // New reset constants for Sumatif
  static const String resetBab1SumatifTitle = 'Reset Bab 1 - Sumatif';
  static const String resetBab1SumatifDescription =
      'Hapus semua kemajuan ujian sumatif pada Bab 1';
  static const String resetBab2SumatifTitle = 'Reset Bab 2 - Sumatif';
  static const String resetBab2SumatifDescription =
      'Hapus semua kemajuan ujian sumatif pada Bab 2';
  static const String resetBab3SumatifTitle = 'Reset Bab 3 - Sumatif';
  static const String resetBab3SumatifDescription =
      'Hapus semua kemajuan ujian sumatif pada Bab 3';
  static const String resetAllSumatifTitle = 'Reset Semua Sumatif';
  static const String resetAllSumatifDescription =
      'Hapus semua kemajuan ujian sumatif dari semua bab';

  // New reset constants for Qowaid
  static const String resetBab1QowaidTitle = 'Reset Bab 1 - Qowaid';
  static const String resetBab1QowaidDescription =
      'Hapus semua kemajuan latihan qowaid pada Bab 1';
  static const String resetBab2QowaidTitle = 'Reset Bab 2 - Qowaid';
  static const String resetBab2QowaidDescription =
      'Hapus semua kemajuan latihan qowaid pada Bab 2';
  static const String resetBab3QowaidTitle = 'Reset Bab 3 - Qowaid';
  static const String resetBab3QowaidDescription =
      'Hapus semua kemajuan latihan qowaid pada Bab 3';
  static const String resetAllQowaidTitle = 'Reset Semua Qowaid';
  static const String resetAllQowaidDescription =
      'Hapus semua kemajuan latihan qowaid dari semua bab';

  static const String resetConfirmationTitle = 'Konfirmasi Reset';
  static const String resetConfirmationMessage =
      'Apakah Anda yakin ingin menghapus data ini? Tindakan ini tidak dapat dibatalkan.';
  static const String resetSuccessMessage = 'Data berhasil dihapus';
  static const String cancelButtonText = 'Batal';
  static const String confirmButtonText = 'Ya, Hapus';
}
