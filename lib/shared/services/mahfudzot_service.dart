import 'dart:math';

import '../data/materials/materials_data.dart';
import '../models/material_content.dart';
import '../models/mufrodat_models.dart';

class MahfudzotService {
  static Future<List<ItemMufrodat>> loadAll() async {
    final List<ItemMufrodat> items = [];

    for (final MaterialContent content in MaterialsData.allMaterials) {
      if (content.kind != 'mahfudzot') continue;
      for (final section in content.sections) {
        final table = section.tableData;
        if (table == null) continue;
        for (final row in table.rows) {
          if (row.length < 3) continue;
          final arabic = row[1].trim();
          final indo = row[2].trim();
          if (arabic.isEmpty || indo.isEmpty) continue;
          items.add(ItemMufrodat(indo, arabic));
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
