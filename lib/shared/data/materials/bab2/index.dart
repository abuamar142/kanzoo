// Bab 2 Materials Data
import '../../../models/material_content.dart';
import 'istima.dart';
import 'kalam.dart';
import 'kitabah.dart';
import 'mufrodat.dart';
import 'qiroah.dart';
import 'qowaid.dart';

export 'istima.dart';
export 'kalam.dart';
export 'kitabah.dart';
export 'mufrodat.dart';
export 'qiroah.dart';
export 'qowaid.dart';

class Bab2MaterialsData {
  static final List<MaterialContent> allContents = [
    Bab2QiroahData.content,
    Bab2KitabahData.content,
    Bab2QowaidData.content,
    Bab2IstimaData.content,
    Bab2KalamData.content,
    content,
  ];

  static MaterialContent? getByKind(String kind) {
    try {
      return allContents.firstWhere(
        (content) => content.kind?.toLowerCase() == kind.toLowerCase(),
      );
    } catch (_) {
      return null;
    }
  }

  static MaterialContent? getByTopicId(String topicId) {
    try {
      return allContents.firstWhere((content) => content.topicId == topicId);
    } catch (_) {
      return null;
    }
  }
}
