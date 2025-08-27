import '../../../../features/materials/models/chapter_content.dart';
import '../../../../features/materials/models/kind_content.dart';
import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import 'istima.dart';
import 'kalam.dart';
import 'kitabah.dart';
import 'mufrodat.dart';
import 'qiroah.dart';
import 'qowaid.dart';

class Bab2MaterialsData {
  static ChapterContent get chapterContent => ChapterContent(
    chapter: Chapter.bab2,
    kinds: [
      KindContent(kind: Kind.kitabah, material: kitabahBab2Content),
      KindContent(kind: Kind.qiroah, material: qiroahBab2Content),
      KindContent(kind: Kind.qowaid, material: qowaidBab2Content),
      KindContent(kind: Kind.kalam, material: kalamBab2Content),
      KindContent(kind: Kind.istima, material: istimaBab2Content),
      KindContent(kind: Kind.mufrodat, material: mufrodatBab2Content),
    ],
  );
}
