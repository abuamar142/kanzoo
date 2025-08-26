import '../../shared/enum/chapter.dart';
import '../../shared/enum/exercise.dart';
import '../../shared/enum/kind.dart';

class SectionIdGenerator {
  /// Generates a section ID for exercises based on chapter, kind, and exercise type
  /// Format: {chapter_title}_{kind_id}_{exercise_type}
  /// Example: bab1_kitabah_scramble, bab2_istima_matching, bab3_qiroah_completion
  static String generateExerciseId(
    Chapter chapter,
    Kind kind,
    Exercise exerciseType,
  ) {
    final chapterTitle = chapter.title.toLowerCase().replaceAll(' ', '');
    final kindId = kind.id.toLowerCase();
    return '${chapterTitle}_${kindId}_${exerciseType.id}';
  }

  /// Generates a section ID for scramble exercises based on chapter and kind
  /// Format: {chapter_title}_{kind_id}_scramble
  /// Example: bab1_kitabah_scramble, bab2_qiroah_scramble
  /// @deprecated Use generateExerciseId with Exercise.scramble instead
  static String generateScrambleId(Chapter chapter, Kind kind) {
    return generateExerciseId(chapter, kind, Exercise.scramble);
  }

  /// Generates a section ID for istima exercises based on chapter, kind, and exercise type
  /// Format: {chapter_title}_{kind_id}_{exercise_type}
  /// Example: bab1_istima_matching, bab2_istima_completion
  /// @deprecated Use generateExerciseId instead
  static String generateIstimaId(
    Chapter chapter,
    Kind kind,
    String exerciseType,
  ) {
    final chapterTitle = chapter.title.toLowerCase().replaceAll(' ', '');
    final kindId = kind.id.toLowerCase();
    return '${chapterTitle}_${kindId}_$exerciseType';
  }

  /// Generates a general section ID based on chapter and kind
  /// Format: {chapter_title}_{kind_id}
  /// Example: bab1_kitabah, bab2_qiroah
  static String generateSectionId(Chapter chapter, Kind kind) {
    final chapterTitle = chapter.title.toLowerCase().replaceAll(' ', '');
    final kindId = kind.id.toLowerCase();
    return '${chapterTitle}_$kindId';
  }

  /// Gets all possible exercise IDs for a specific chapter and exercise type
  static List<String> getAllExerciseIdsForChapter(
    Chapter chapter,
    Exercise exerciseType,
  ) {
    return Kind.values
        .map((kind) => generateExerciseId(chapter, kind, exerciseType))
        .toList();
  }

  /// Gets all possible exercise IDs for a specific kind and exercise type across all chapters
  static List<String> getAllExerciseIdsForKind(
    Kind kind,
    Exercise exerciseType,
  ) {
    return Chapter.values
        .where((chapter) => chapter != Chapter.general)
        .map((chapter) => generateExerciseId(chapter, kind, exerciseType))
        .toList();
  }

  /// Gets all possible exercise IDs for a specific exercise type
  static List<String> getAllExerciseIdsForType(Exercise exerciseType) {
    final List<String> ids = [];
    for (final chapter in Chapter.values) {
      if (chapter != Chapter.general) {
        for (final kind in Kind.values) {
          ids.add(generateExerciseId(chapter, kind, exerciseType));
        }
      }
    }
    return ids;
  }

  /// Gets all possible scramble section IDs for a specific chapter
  /// @deprecated Use getAllExerciseIdsForChapter with Exercise.scramble instead
  static List<String> getAllScrambleIdsForChapter(Chapter chapter) {
    return getAllExerciseIdsForChapter(chapter, Exercise.scramble);
  }

  /// Gets all possible scramble section IDs for a specific kind across all chapters
  /// @deprecated Use getAllExerciseIdsForKind with Exercise.scramble instead
  static List<String> getAllScrambleIdsForKind(Kind kind) {
    return getAllExerciseIdsForKind(kind, Exercise.scramble);
  }

  /// Gets all possible scramble section IDs
  /// @deprecated Use getAllExerciseIdsForType with Exercise.scramble instead
  static List<String> getAllScrambleIds() {
    return getAllExerciseIdsForType(Exercise.scramble);
  }
}
