import '../../shared/enum/chapter.dart';
import '../../shared/enum/kind.dart';

class SectionIdGenerator {
  /// Generates a section ID for scramble exercises based on chapter and kind
  /// Format: {chapter_title}_{kind_id}_scramble
  /// Example: bab1_kitabah_scramble, bab2_qiroah_scramble
  static String generateScrambleId(Chapter chapter, Kind kind) {
    final chapterTitle = chapter.title.toLowerCase().replaceAll(' ', '');
    final kindId = kind.id.toLowerCase();
    return '${chapterTitle}_${kindId}_scramble';
  }

  /// Generates a general section ID based on chapter and kind
  /// Format: {chapter_title}_{kind_id}
  /// Example: bab1_kitabah, bab2_qiroah
  static String generateSectionId(Chapter chapter, Kind kind) {
    final chapterTitle = chapter.title.toLowerCase().replaceAll(' ', '');
    final kindId = kind.id.toLowerCase();
    return '${chapterTitle}_$kindId';
  }

  /// Gets all possible scramble section IDs for a specific chapter
  static List<String> getAllScrambleIdsForChapter(Chapter chapter) {
    return Kind.values
        .map((kind) => generateScrambleId(chapter, kind))
        .toList();
  }

  /// Gets all possible scramble section IDs for a specific kind across all chapters
  static List<String> getAllScrambleIdsForKind(Kind kind) {
    return Chapter.values
        .where(
          (chapter) => chapter != Chapter.general,
        ) // Exclude general chapter
        .map((chapter) => generateScrambleId(chapter, kind))
        .toList();
  }

  /// Gets all possible scramble section IDs
  static List<String> getAllScrambleIds() {
    final List<String> ids = [];
    for (final chapter in Chapter.values) {
      if (chapter != Chapter.general) {
        // Exclude general chapter
        for (final kind in Kind.values) {
          ids.add(generateScrambleId(chapter, kind));
        }
      }
    }
    return ids;
  }
}
