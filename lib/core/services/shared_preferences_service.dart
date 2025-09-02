import 'package:shared_preferences/shared_preferences.dart';

import '../../shared/enum/chapter.dart';
import '../../shared/enum/exercise.dart';
import '../../shared/enum/kind.dart';
import '../constants/app_constants.dart';
import '../utils/section_id_generator.dart';

class SharedPreferencesService {
  static SharedPreferences? _prefs;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Font Size preferences
  static Future<void> setFontSize(double fontSize) async {
    await _prefs?.setDouble(AppConstants.materialFontSizeKey, fontSize);
  }

  static double getFontSize() {
    return _prefs?.getDouble(AppConstants.materialFontSizeKey) ??
        AppConstants.materialFontSizeDefault;
  }

  // Reset font size to default
  static Future<void> resetFontSize() async {
    await _prefs?.remove(AppConstants.materialFontSizeKey);
  }

  // User progress preferences
  static Future<void> setUserProgress(String key, dynamic value) async {
    if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    }
  }

  static T? getUserProgress<T>(String key) {
    return _prefs?.get(key) as T?;
  }

  // Clear all preferences
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }

  // Remove specific key
  static Future<void> remove(String key) async {
    await _prefs?.remove(key);
  }

  // Check if key exists
  static bool containsKey(String key) {
    return _prefs?.containsKey(key) ?? false;
  }

  // Scramble completion preferences
  static Future<void> setScrambleCompleted(
    String scrambleId,
    bool isCompleted,
  ) async {
    await _prefs?.setBool('scramble_$scrambleId', isCompleted);
  }

  static bool isScrambleCompleted(String scrambleId) {
    return _prefs?.getBool('scramble_$scrambleId') ?? false;
  }

  static Future<void> clearScrambleProgress(String scrambleId) async {
    await _prefs?.remove('scramble_$scrambleId');
  }

  static Future<void> clearSectionProgress(String sectionId) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('scramble_$sectionId') ||
          key.startsWith('section_answers_$sectionId')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllScrambleProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('scramble_')) {
        await _prefs?.remove(key);
      }
    }
  }

  // Chapter and Kind based methods
  static Future<void> clearChapterProgress(Chapter chapter) async {
    final sectionIds = SectionIdGenerator.getAllScrambleIdsForChapter(chapter);
    for (String sectionId in sectionIds) {
      await clearSectionProgress(sectionId);
    }
  }

  static Future<void> clearKindProgress(Kind kind) async {
    final sectionIds = SectionIdGenerator.getAllScrambleIdsForKind(kind);
    for (String sectionId in sectionIds) {
      await clearSectionProgress(sectionId);
    }
  }

  static Future<void> clearChapterKindProgress(
    Chapter chapter,
    Kind kind,
  ) async {
    final sectionId = SectionIdGenerator.generateScrambleId(chapter, kind);
    await clearSectionProgress(sectionId);
  }

  static String getScrambleId(Chapter chapter, Kind kind) {
    return SectionIdGenerator.generateScrambleId(chapter, kind);
  }

  // Istima exercise completion preferences
  static Future<void> markIstimaExerciseCompleted(String exerciseId) async {
    await _prefs?.setBool('istima_$exerciseId', true);
  }

  static bool isIstimaExerciseCompleted(String exerciseId) {
    return _prefs?.getBool('istima_$exerciseId') ?? false;
  }

  static Future<void> clearIstimaExerciseProgress(String exerciseId) async {
    await _prefs?.remove('istima_$exerciseId');
  }

  static Future<void> clearIstimaChapterProgress(Chapter chapter) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('istima_${chapter.name}_istima_')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllIstimaProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('istima_') || key.startsWith('section_answers_')) {
        await _prefs?.remove(key);
      }
    }
  }

  // Exercise-based methods using new Exercise enum
  static Future<void> markExerciseCompleted(String exerciseId) async {
    await _prefs?.setBool('exercise_$exerciseId', true);
  }

  static bool isExerciseCompleted(String exerciseId) {
    return _prefs?.getBool('exercise_$exerciseId') ?? false;
  }

  static Future<void> clearExerciseProgress(String exerciseId) async {
    await _prefs?.remove('exercise_$exerciseId');
  }

  static Future<void> clearChapterExerciseProgress(
    Chapter chapter,
    Exercise exercise,
  ) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('exercise_${chapter.name}_istima_${exercise.id}')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearChapterIstimaProgress(Chapter chapter) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('exercise_${chapter.name}_istima_') ||
          key.startsWith('istima_${chapter.name}_istima_') ||
          key.startsWith('section_answers_${chapter.name}_istima_')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearKindExerciseProgress(
    Kind kind,
    Exercise exercise,
  ) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.contains('_${kind.name}_${exercise.id}')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllExerciseProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('exercise_') ||
          key.startsWith('istima_') ||
          key.startsWith('answers_') ||
          key.startsWith('section_answers_')) {
        await _prefs?.remove(key);
      }
    }
  }

  // New methods for saving complete exercise results (both correct and incorrect)
  static Future<void> saveExerciseResults(
    String sectionId,
    Map<int, List<int>>
    answers, // For matching section (multiple answers per question)
  ) async {
    final answersData = <String, List<int>>{};
    answers.forEach((questionIndex, selectedAnswers) {
      answersData[questionIndex.toString()] = selectedAnswers;
    });

    // Convert to JSON-like string representation
    final answersString = answersData.entries
        .map((e) => '${e.key}:${e.value.join(',')}')
        .join('|');

    await _prefs?.setString('section_answers_$sectionId', answersString);
  }

  static Future<void> saveCompletionExerciseResults(
    String sectionId,
    Map<int, int>
    answers, // For completion section (single answer per question)
  ) async {
    final answersString = answers.entries
        .map((e) => '${e.key}:${e.value}')
        .join('|');

    await _prefs?.setString('section_answers_$sectionId', answersString);
  }

  // New method for saving multiple choice results
  static Future<void> saveMultipleChoiceResults(
    String sectionId,
    List<int?> selectedAnswers,
  ) async {
    final answersData = <String>[];
    for (int i = 0; i < selectedAnswers.length; i++) {
      answersData.add('$i:${selectedAnswers[i] ?? -1}');
    }
    final answersString = answersData.join('|');
    await _prefs?.setString('section_answers_$sectionId', answersString);
  }

  // New method for saving dragable matching results
  static Future<void> saveDragableMatchingResults(
    String sectionId,
    Map<String, String> matchedPairs,
  ) async {
    final answersData = matchedPairs.entries
        .map((e) => '${e.key}:::${e.value}')
        .join('|');
    await _prefs?.setString('section_answers_$sectionId', answersData);
  }

  static Map<int, List<int>> getExerciseResults(String sectionId) {
    final answersString = _prefs?.getString('section_answers_$sectionId');
    if (answersString == null || answersString.isEmpty) {
      return {};
    }

    final results = <int, List<int>>{};
    final pairs = answersString.split('|');

    for (final pair in pairs) {
      if (pair.isEmpty) continue;
      final parts = pair.split(':');
      if (parts.length == 2) {
        final questionIndex = int.tryParse(parts[0]);
        final answers = parts[1]
            .split(',')
            .map((e) => int.tryParse(e))
            .where((e) => e != null)
            .cast<int>()
            .toList();
        if (questionIndex != null) {
          results[questionIndex] = answers;
        }
      }
    }

    return results;
  }

  static Map<int, int> getCompletionExerciseResults(String sectionId) {
    final answersString = _prefs?.getString('section_answers_$sectionId');
    if (answersString == null || answersString.isEmpty) {
      return {};
    }

    final results = <int, int>{};
    final pairs = answersString.split('|');

    for (final pair in pairs) {
      if (pair.isEmpty) continue;
      final parts = pair.split(':');
      if (parts.length == 2) {
        final questionIndex = int.tryParse(parts[0]);
        final answer = int.tryParse(parts[1]);
        if (questionIndex != null && answer != null) {
          results[questionIndex] = answer;
        }
      }
    }

    return results;
  }

  // New getter methods for the additional save functions
  static List<int?> getMultipleChoiceResults(String sectionId) {
    final answersString = _prefs?.getString('section_answers_$sectionId');
    if (answersString == null || answersString.isEmpty) {
      return [];
    }

    final results = <int, int?>{};
    final pairs = answersString.split('|');
    int maxIndex = 0;

    for (final pair in pairs) {
      if (pair.isEmpty) continue;
      final parts = pair.split(':');
      if (parts.length == 2) {
        final questionIndex = int.tryParse(parts[0]);
        final answer = int.tryParse(parts[1]);
        if (questionIndex != null) {
          results[questionIndex] = answer == -1 ? null : answer;
          maxIndex = questionIndex > maxIndex ? questionIndex : maxIndex;
        }
      }
    }

    // Convert to list format
    final resultList = <int?>[];
    for (int i = 0; i <= maxIndex; i++) {
      resultList.add(results[i]);
    }

    return resultList;
  }

  static Map<String, String> getDragableMatchingResults(String sectionId) {
    final answersString = _prefs?.getString('section_answers_$sectionId');
    if (answersString == null || answersString.isEmpty) {
      return {};
    }

    final results = <String, String>{};
    final pairs = answersString.split('|');

    for (final pair in pairs) {
      if (pair.isEmpty) continue;
      final parts = pair.split(':::');
      if (parts.length == 2) {
        results[parts[0]] = parts[1];
      }
    }

    return results;
  }

  static Future<void> clearSectionAnswers(String sectionId) async {
    await _prefs?.remove('section_answers_$sectionId');
  }

  // New methods for clearing Sumatif progress specifically
  static Future<void> clearChapterSumatifProgress(Chapter chapter) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('section_answers_${chapter.name}_sumatif_') ||
          key.startsWith('exercise_${chapter.name}_sumatif_')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllSumatifProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.contains('_sumatif_') || key.contains('sumatif')) {
        await _prefs?.remove(key);
      }
    }
  }

  // New methods for clearing Qowaid multiple choice progress specifically
  static Future<void> clearChapterQowaidProgress(Chapter chapter) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('section_answers_${chapter.name}_qowaid_') ||
          key.startsWith('exercise_${chapter.name}_qowaid_')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllQowaidProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.contains('_qowaid_') || key.contains('qowaid')) {
        await _prefs?.remove(key);
      }
    }
  }

  // New methods for clearing Kitabah progress specifically
  static Future<void> clearChapterKitabahProgress(Chapter chapter) async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.startsWith('section_answers_${chapter.name}_kitabah_') ||
          key.startsWith('scramble_${chapter.name}_kitabah_')) {
        await _prefs?.remove(key);
      }
    }
  }

  static Future<void> clearAllKitabahProgress() async {
    final keys = _prefs?.getKeys() ?? <String>{};
    for (String key in keys) {
      if (key.contains('_kitabah_') || key.contains('kitabah')) {
        await _prefs?.remove(key);
      }
    }
  }
}
