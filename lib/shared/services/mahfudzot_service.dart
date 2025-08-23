import 'dart:math';

import '../data/materials/chapter_materials_data.dart';
import '../models/templates/section_three.dart';
import '../shared.dart';

class MahfudzotService {
  static Future<List<ItemMufrodat>> loadAll() async {
    final List<ItemMufrodat> items = [];

    final generalContent = ChapterMaterialsData.allChapters
        .where((content) => content.chapter == Chapter.general)
        .firstOrNull;

    if (generalContent != null) {
      final mahfudzotKind = generalContent.kinds
          .where((k) => k.kind == Kind.mahfudzot)
          .firstOrNull;

      if (mahfudzotKind != null) {
        for (final section in mahfudzotKind.material.sections) {
          if (section is SectionThree) {
            for (final wordPair in section.wordPairs) {
              if (wordPair.length >= 2) {
                final indo = wordPair[0].trim();
                final arabic = wordPair[1].trim();

                if (arabic.isNotEmpty && indo.isNotEmpty) {
                  items.add(ItemMufrodat(indo, arabic));
                }
              }
            }
          }
        }
      }
    }

    return items;
  }

  static Future<ItemMufrodat?> randomOne() async {
    final all = await loadAll();
    if (all.isEmpty) return null;
    final rnd = Random();
    return all[rnd.nextInt(all.length)];
  }
}
