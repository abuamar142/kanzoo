import '../../../../features/materials/models/chapter_content.dart';
import '../../../../features/materials/models/kind_content.dart';
import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import 'mahfudzot.dart';

class GeneralMaterialsData {
  static ChapterContent get chapterContent => ChapterContent(
    chapter: Chapter.general,
    kinds: [
      KindContent(kind: Kind.mahfudzot, material: mahfudzotGeneralContent),
    ],
  );
}
