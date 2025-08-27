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
import 'sumatif.dart';

class Bab1MaterialsData {
  static ChapterContent get chapterContent => ChapterContent(
    chapter: Chapter.bab1,
    kinds: [
      KindContent(kind: Kind.kitabah, material: kitabahBab1Content),
      KindContent(kind: Kind.qiroah, material: qiroahBab1Content),
      KindContent(kind: Kind.qowaid, material: qowaidBab1Content),
      KindContent(kind: Kind.kalam, material: kalamBab1Content),
      KindContent(kind: Kind.istima, material: istimaBab1Content),
      KindContent(kind: Kind.mufrodat, material: mufrodatBab1Content),
      KindContent(kind: Kind.sumatif, material: sumatifBab1Content),
    ],
  );
}
