import 'dart:math';

import '../data/mufrodat_data.dart';
import '../models/mufrodat_models.dart';

class MufrodatService {
  static Future<List<ItemMufrodat>> loadAll() async {
    // Return static data (no I/O)
    return MufrodatData.items;
  }

  static Future<List<ItemMufrodat>> randomSample(int count) async {
    final all = await loadAll();
    if (all.isEmpty) return const [];
    final rnd = Random();
    final list = List<ItemMufrodat>.from(all);
    for (int i = list.length - 1; i > 0; i--) {
      final j = rnd.nextInt(i + 1);
      final tmp = list[i];
      list[i] = list[j];
      list[j] = tmp;
    }
    return list.take(count).toList();
  }
}
