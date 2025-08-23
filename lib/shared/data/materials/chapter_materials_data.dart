import '../../../features/materials/models/chapter_content.dart';
import '../../enum/chapter.dart';
import 'bab1/index.dart';
import 'bab2/index.dart';
import 'bab3/index.dart';
import 'general/index.dart';

class ChapterMaterialsData {
  static List<ChapterContent> get allChapters => [
    GeneralMaterialsData.chapterContent,
    Bab1MaterialsData.chapterContent,
    Bab2MaterialsData.chapterContent,
    Bab3MaterialsData.chapterContent,
  ];

  static ChapterContent? getByChapter(Chapter chapter) {
    switch (chapter) {
      case Chapter.general:
        return GeneralMaterialsData.chapterContent;
      case Chapter.bab1:
        return Bab1MaterialsData.chapterContent;
      case Chapter.bab2:
        return Bab2MaterialsData.chapterContent;
      case Chapter.bab3:
        return Bab3MaterialsData.chapterContent;
    }
  }
}
