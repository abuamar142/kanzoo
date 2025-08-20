// Bab 1 Materials Data
import '../../../models/material_content.dart';
import 'istima.dart';
import 'kalam.dart';
import 'kitabah.dart';
import 'mahfudzot.dart';
import 'mufrodat.dart';
import 'qiroah.dart';
import 'qowaid.dart';

export 'istima.dart';
export 'kalam.dart';
export 'kitabah.dart';
export 'mahfudzot.dart';
export 'mufrodat.dart';
export 'qiroah.dart';
export 'qowaid.dart';

class Bab1MaterialsData {
  static final List<MaterialContent> allContents = [
    Bab1QiroahData.content,
    Bab1KitabahData.content,
    Bab1QowaidData.content,
    Bab1IstimaData.content,
    Bab1KalamData.content,
    content,
    Bab1MahfudzotData.content,
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
