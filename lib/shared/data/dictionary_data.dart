import '../../core/constants/app_constants.dart';
import '../models/dictionary_entry.dart';

// Default-ordered dummy data grouped by section
class DictionaryData {
  static final List<DictionaryEntry> items = [
    // Perkenalan (Pronouns/introductions)
    DictionaryEntry(
      arabic: 'أنا',
      indonesian: 'aku / saya',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'أنتَ',
      indonesian: 'kamu (laki-laki)',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'أنتِ',
      indonesian: 'kamu (perempuan)',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'هو',
      indonesian: 'dia (laki-laki)',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'هي',
      indonesian: 'dia (perempuan)',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'نحن',
      indonesian: 'kami / kita',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'أنتم',
      indonesian: 'kalian',
      section: AppConstants.dictionarySectionIntroduction,
    ),
    DictionaryEntry(
      arabic: 'هم',
      indonesian: 'mereka',
      section: AppConstants.dictionarySectionIntroduction,
    ),

    // Kata Tunjuk (Demonstratives)
    DictionaryEntry(
      arabic: 'هذا',
      indonesian: 'ini (laki-laki)',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
    DictionaryEntry(
      arabic: 'هذه',
      indonesian: 'ini (perempuan)',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
    DictionaryEntry(
      arabic: 'ذلك',
      indonesian: 'itu (laki-laki)',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
    DictionaryEntry(
      arabic: 'تلك',
      indonesian: 'itu (perempuan)',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
    DictionaryEntry(
      arabic: 'هنا',
      indonesian: 'di sini',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
    DictionaryEntry(
      arabic: 'هناك',
      indonesian: 'di sana',
      section: AppConstants.dictionarySectionDemonstratives,
    ),
  ];

  // For default order, we keep as-is grouped by section above
}

