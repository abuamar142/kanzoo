import '../../../../features/materials/models/chapter_content.dart';
import '../../../../features/materials/models/kind_content.dart';
import '../../../enum/chapter.dart';
import '../../../enum/kind.dart';
import 'istima.dart';
import 'kalam.dart';
import 'kitabah.dart';
import 'mufrodat.dart';
import 'qiroah.dart';

class Bab3MaterialsData {
  static ChapterContent get chapterContent => ChapterContent(
    chapter: Chapter.bab3,
    kinds: [
      KindContent(kind: Kind.kitabah, material: kitabahBab3Content),
      KindContent(kind: Kind.qiroah, material: qiroahBab3Content),
      KindContent(kind: Kind.kalam, material: kalamBab3Content),
      KindContent(kind: Kind.istima, material: istimaBab3Content),
      KindContent(kind: Kind.mufrodat, material: mufrodatBab3Content),
    ],
  );
}
