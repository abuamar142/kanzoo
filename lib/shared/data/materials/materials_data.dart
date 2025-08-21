import '../../enum/chapter.dart';
import '../../enum/kind.dart';
import '../../models/material_content.dart';
import '../../models/mufrodat_models.dart';
import 'bab1/index.dart';
import 'bab2/index.dart';
import 'bab3/index.dart';

/// Centralized access to all materials data organized by chapters
class MaterialsData {
  /// All materials for all chapters
  static final List<MaterialContent> allMaterials = [
    ...Bab1MaterialsData.allContents,
    ...Bab2MaterialsData.allContents,
    ...Bab3Materials.all,
  ];

  /// Get materials by chapter number
  static List<MaterialContent> getByChapter(int chapter) {
    switch (chapter) {
      case 1:
        return Bab1MaterialsData.allContents;
      case 2:
        return Bab2MaterialsData.allContents;
      case 3:
        return Bab3Materials.all;
      default:
        return [];
    }
  }

  /// Get specific material by chapter and kind
  static MaterialContent? getByChapterAndKind(int chapter, String kind) {
    final chapterMaterials = getByChapter(chapter);
    try {
      return chapterMaterials.firstWhere((material) => material.kind == kind);
    } catch (e) {
      return null;
    }
  }

  /// Get material by topic ID
  static MaterialContent? getByTopicId(String topicId) {
    try {
      return allMaterials.firstWhere((material) => material.topicId == topicId);
    } catch (e) {
      return null;
    }
  }

  /// Get available material kinds for a chapter
  static List<String> getAvailableKinds(int chapter) {
    final chapterMaterials = getByChapter(chapter);
    return chapterMaterials.map((m) => m.kind!).toList();
  }

  // ========== ENUM-BASED METHODS ==========

  /// Get materials by Chapter enum
  static List<MaterialContent> getByChapterEnum(Chapter chapter) {
    return getByChapter(chapter.id);
  }

  /// Get specific material by Chapter enum and Kind enum
  static MaterialContent? getByChapterAndKindEnum(Chapter chapter, Kind kind) {
    return getByChapterAndKind(chapter.id, kind.id);
  }

  /// Get available Kind enums for a Chapter enum
  static List<Kind> getAvailableKindEnums(Chapter chapter) {
    final chapterMaterials = getByChapterEnum(chapter);
    final kindIds = chapterMaterials.map((m) => m.kind!).toList();
    return kindIds
        .map((id) => Kind.findById(id))
        .where((kind) => kind != null)
        .cast<Kind>()
        .toList();
  }

  /// Check if a Chapter enum has materials
  static bool hasChapterEnum(Chapter chapter) {
    return hasChapter(chapter.id);
  }

  /// Get all available Chapter enums (convenience method)
  static List<Chapter> get availableChapterEnums => Chapter.all;

  /// Get all available chapters
  static List<int> get availableChapters => [1, 2, 3];

  /// Check if a chapter has materials
  static bool hasChapter(int chapter) {
    return availableChapters.contains(chapter);
  }

  /// Get material counts by chapter
  static Map<int, int> get materialCountsByChapter => {
    1: Bab1MaterialsData.allContents.length,
    2: Bab2MaterialsData.allContents.length,
    3: Bab3Materials.all.length,
  };

  static List<MaterialSection> buildMufrodatSections(
    List<CategoryMufrodat> categories,
  ) {
    return categories.map((category) {
      // Create table data from mufrodat items
      final headers = ['No', 'Bahasa Indonesia', 'البحث العربي'];
      final rows = <List<String>>[];

      for (int i = 0; i < category.items.length; i++) {
        final item = category.items[i];
        rows.add(['${i + 1}', item.indonesian, item.arabic]);
      }

      return MaterialSection(
        title: category.title,
        type: MaterialSectionType.table,
        tableData: MaterialTableData(headers: headers, rows: rows),
      );
    }).toList();
  }
}
