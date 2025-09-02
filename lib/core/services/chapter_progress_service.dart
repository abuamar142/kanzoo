import '../../shared/enum/chapter.dart';
import '../../shared/enum/kind.dart';
import '../utils/section_id_generator.dart';
import 'shared_preferences_service.dart';

class ChapterProgressService {
  // Required passing percentage
  static const double requiredPassingPercentage = 80.0;

  /// Check if a chapter is unlocked (can be accessed)
  static bool isChapterUnlocked(Chapter chapter) {
    // Chapter 1 is always unlocked
    if (chapter == Chapter.bab1) return true;

    // Get the previous chapter
    Chapter? previousChapter;
    switch (chapter) {
      case Chapter.bab2:
        previousChapter = Chapter.bab1;
        break;
      case Chapter.bab3:
        previousChapter = Chapter.bab2;
        break;
      case Chapter.bab1:
      case Chapter.general:
        return true;
    }

    // Check if previous chapter is completed with required percentage
    return isChapterCompleted(previousChapter);
  }

  /// Check if a chapter is completed (all exercises done with 80%+ score)
  static bool isChapterCompleted(Chapter chapter) {
    // Get all exercise completion data for the chapter
    final qowaidCompleted = _isKindCompleted(chapter, Kind.qowaid);
    final kitabahCompleted = _isKindCompleted(chapter, Kind.kitabah);
    final sumatifCompleted = _isKindCompleted(chapter, Kind.sumatif);

    // All major exercise types must be completed
    return qowaidCompleted && kitabahCompleted && sumatifCompleted;
  }

  /// Check if a specific kind in a chapter is completed with passing percentage
  static bool _isKindCompleted(Chapter chapter, Kind kind) {
    switch (kind) {
      case Kind.qowaid:
        return _isQowaidCompleted(chapter);
      case Kind.kitabah:
        return _isKitabahCompleted(chapter);
      case Kind.sumatif:
        return _isSumatifCompleted(chapter);
      default:
        return true; // Other kinds don't block chapter progression
    }
  }

  /// Check if Qowaid exercises are completed with passing percentage
  static bool _isQowaidCompleted(Chapter chapter) {
    // Get section IDs for Qowaid multiple choice exercises
    final sectionIds = _getQowaidSectionIds(chapter);

    for (String sectionId in sectionIds) {
      if (!SharedPreferencesService.isExerciseCompleted(sectionId)) {
        return false;
      }

      // Check if the score meets the required percentage
      final results = SharedPreferencesService.getMultipleChoiceResults(
        sectionId,
      );
      if (results.isEmpty) return false;

      final percentage = _calculateMultipleChoicePercentage(sectionId, results);
      if (percentage < requiredPassingPercentage) {
        return false;
      }
    }

    return sectionIds.isNotEmpty;
  }

  /// Check if Kitabah exercises are completed with passing percentage
  static bool _isKitabahCompleted(Chapter chapter) {
    // Get section IDs for Kitabah exercises
    final sectionIds = _getKitabahSectionIds(chapter);

    for (String sectionId in sectionIds) {
      if (!SharedPreferencesService.isExerciseCompleted(sectionId)) {
        return false;
      }

      // For kitabah (scramble exercises), we consider them completed if done
      // since they're more about understanding structure than scoring
    }

    return sectionIds.isNotEmpty;
  }

  /// Check if Sumatif exercises are completed with passing percentage
  static bool _isSumatifCompleted(Chapter chapter) {
    // Get section IDs for Sumatif exercises
    final sectionIds = _getSumatifSectionIds(chapter);

    for (String sectionId in sectionIds) {
      if (!SharedPreferencesService.isExerciseCompleted(sectionId)) {
        return false;
      }

      if (sectionId.contains('multiple_choice')) {
        // Check multiple choice score
        final results = SharedPreferencesService.getMultipleChoiceResults(
          sectionId,
        );
        if (results.isEmpty) return false;

        final percentage = _calculateMultipleChoicePercentage(
          sectionId,
          results,
        );
        if (percentage < requiredPassingPercentage) {
          return false;
        }
      } else if (sectionId.contains('dragable_matching')) {
        // Check matching score
        final results = SharedPreferencesService.getDragableMatchingResults(
          sectionId,
        );
        if (results.isEmpty) return false;

        final percentage = _calculateMatchingPercentage(sectionId, results);
        if (percentage < requiredPassingPercentage) {
          return false;
        }
      }
    }

    return sectionIds.isNotEmpty;
  }

  /// Calculate percentage for multiple choice exercises
  static double _calculateMultipleChoicePercentage(
    String sectionId,
    List<int?> results,
  ) {
    // Get the correct answers based on section ID
    final correctAnswers = _getCorrectAnswersForSection(sectionId);
    if (correctAnswers.isEmpty || results.isEmpty) return 0.0;

    int correctCount = 0;
    for (int i = 0; i < results.length && i < correctAnswers.length; i++) {
      if (results[i] == correctAnswers[i]) {
        correctCount++;
      }
    }

    return (correctCount / correctAnswers.length) * 100;
  }

  /// Calculate percentage for matching exercises
  static double _calculateMatchingPercentage(
    String sectionId,
    Map<String, String> results,
  ) {
    // Get the correct pairs based on section ID
    final correctPairs = _getCorrectPairsForSection(sectionId);
    if (correctPairs.isEmpty || results.isEmpty) return 0.0;

    int correctCount = 0;
    for (final entry in correctPairs.entries) {
      if (results[entry.key] == entry.value) {
        correctCount++;
      }
    }

    return (correctCount / correctPairs.length) * 100;
  }

  /// Get Qowaid section IDs for a chapter
  static List<String> _getQowaidSectionIds(Chapter chapter) {
    final baseId = SectionIdGenerator.generateSectionId(chapter, Kind.qowaid);
    switch (chapter) {
      case Chapter.bab1:
        return ['${baseId}_multiple_choice', 'bab1_qowaid_khabar_mc'];
      case Chapter.bab2:
        return ['${baseId}_multiple_choice'];
      case Chapter.bab3:
        return ['${baseId}_multiple_choice'];
      case Chapter.general:
        return [];
    }
  }

  /// Get Kitabah section IDs for a chapter
  static List<String> _getKitabahSectionIds(Chapter chapter) {
    final baseId = SectionIdGenerator.generateSectionId(chapter, Kind.kitabah);
    switch (chapter) {
      case Chapter.bab1:
        return ['${baseId}_scramble'];
      case Chapter.bab2:
        return ['${baseId}_scramble'];
      case Chapter.bab3:
        return ['bab3_kitabah_dhamir_mc'];
      case Chapter.general:
        return [];
    }
  }

  /// Get Sumatif section IDs for a chapter
  static List<String> _getSumatifSectionIds(Chapter chapter) {
    final baseId = SectionIdGenerator.generateSectionId(chapter, Kind.sumatif);
    return ['${baseId}_multiple_choice', '${baseId}_dragable_matching'];
  }

  /// Get correct answers for a specific section
  static List<int> _getCorrectAnswersForSection(String sectionId) {
    // Define correct answers for each section
    if (sectionId.contains('bab1') && sectionId.contains('qowaid')) {
      if (sectionId.contains('khabar')) {
        return [1, 0, 1, 1, 0]; // Khabar exercise answers
      }
      return [0, 1, 0, 1]; // Main Qowaid exercise answers
    } else if (sectionId.contains('bab1') &&
        sectionId.contains('sumatif') &&
        sectionId.contains('multiple_choice')) {
      return [
        1,
        1,
        2,
        0,
        2,
        1,
        2,
        1,
        1,
        2,
        3,
        1,
        0,
        1,
        3,
      ]; // Bab 1 Sumatif answers
    } else if (sectionId.contains('bab2') && sectionId.contains('qowaid')) {
      return [1, 2, 0, 1]; // Bab 2 Qowaid answers
    } else if (sectionId.contains('bab2') &&
        sectionId.contains('sumatif') &&
        sectionId.contains('multiple_choice')) {
      return [
        1,
        2,
        0,
        2,
        2,
        1,
        3,
        2,
        1,
        3,
        2,
        1,
        1,
        2,
        2,
      ]; // Bab 2 Sumatif answers
    } else if (sectionId.contains('bab3') && sectionId.contains('qowaid')) {
      return [1, 0, 2, 1]; // Bab 3 Qowaid answers
    } else if (sectionId.contains('bab3') && sectionId.contains('kitabah')) {
      return [2, 1, 0, 2, 1]; // Bab 3 Kitabah multiple choice answers
    } else if (sectionId.contains('bab3') &&
        sectionId.contains('sumatif') &&
        sectionId.contains('multiple_choice')) {
      return [
        0,
        2,
        0,
        1,
        3,
        0,
        1,
        1,
        0,
        3,
        3,
        2,
        1,
        3,
        0,
      ]; // Bab 3 Sumatif answers
    }

    return [];
  }

  /// Get correct pairs for matching sections
  static Map<String, String> _getCorrectPairsForSection(String sectionId) {
    if (sectionId.contains('bab1') && sectionId.contains('sumatif')) {
      return {
        'هُوَ': 'Dia (lk)',
        'هَذِهِ': 'Ini (pr)',
        'تِلْكَ': 'Itu (pr)',
        'أَنْتَ': 'Kamu (lk)',
        'أَنَا': 'Saya',
      };
    } else if (sectionId.contains('bab2') && sectionId.contains('sumatif')) {
      return {
        'أَيْنَ': 'Di mana',
        'مِنْ أَيْنَ': 'Dari mana',
        'إِلَى أَيْنَ': 'Ke mana',
        'جَانِبَ': 'Di samping',
        'وَرَاءَ': 'Di belakang',
      };
    } else if (sectionId.contains('bab3') && sectionId.contains('sumatif')) {
      return {
        'كِتَابِي': 'Bukuku',
        'كِتَابُكَ': 'Bukumu (lk)',
        'كِتَابُهُ': 'Bukunya (lk)',
        'كِتَابُهَا': 'Bukunya (pr)',
        'كِتَابُنَا': 'Buku kita',
      };
    }

    return {};
  }

  /// Get chapter completion percentage
  static double getChapterCompletionPercentage(Chapter chapter) {
    final qowaidCompleted = _isKindCompleted(chapter, Kind.qowaid);
    final kitabahCompleted = _isKindCompleted(chapter, Kind.kitabah);
    final sumatifCompleted = _isKindCompleted(chapter, Kind.sumatif);

    int completedCount = 0;
    if (qowaidCompleted) completedCount++;
    if (kitabahCompleted) completedCount++;
    if (sumatifCompleted) completedCount++;

    return (completedCount / 3) * 100;
  }

  /// Get detailed chapter progress information
  static Map<String, dynamic> getChapterProgress(Chapter chapter) {
    return {
      'isUnlocked': isChapterUnlocked(chapter),
      'isCompleted': isChapterCompleted(chapter),
      'completionPercentage': getChapterCompletionPercentage(chapter),
      'qowaidCompleted': _isKindCompleted(chapter, Kind.qowaid),
      'kitabahCompleted': _isKindCompleted(chapter, Kind.kitabah),
      'sumatifCompleted': _isKindCompleted(chapter, Kind.sumatif),
    };
  }
}
