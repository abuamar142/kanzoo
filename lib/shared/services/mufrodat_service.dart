import 'dart:math';

import 'package:flutter/services.dart' show rootBundle;

import '../models/mufrodat_entry.dart';

class MufrodatService {
  static const String assetPath = 'assets/materials/materi_mufrodat.md';

  static Future<List<MufrodatEntry>> loadAll() async {
    final raw = await rootBundle.loadString(assetPath);
    final lines = raw.split(RegExp(r'\r?\n'));
    final entries = <MufrodatEntry>[];

    for (final line in lines) {
      final l = line.trim();
      if (!l.startsWith('|')) continue;
      if (l.contains(':-:')) continue; // alignment row
      // Remove bold markers
      String clean = l.replaceAll('**', '');
      // Split and strip empties at edges
      final parts = clean
          .split('|')
          .map((e) => e.trim())
          .where((e) => e.isNotEmpty)
          .toList();
      if (parts.length < 2) continue;
      // Skip header rows: contain Arabic header titles
      final joined = parts.join(' ');
      if (joined.contains('المَعنى') ||
          joined.contains('الكَلِمَة') ||
          joined.contains('الجَوَاب') ||
          joined.contains('التَّحِيَّة')) {
        continue;
      }
      // Pair every two items: (meaning,idn) + (word,arabic)
      for (int i = 0; i + 1 < parts.length; i += 2) {
        final indo = parts[i];
        final arab = parts[i + 1];
        if (indo.isEmpty || arab.isEmpty) continue;
        entries.add(MufrodatEntry(indonesian: indo, arabic: arab));
      }
    }

    return entries;
  }

  static Future<List<MufrodatEntry>> randomSample(int count) async {
    final all = await loadAll();
    if (all.isEmpty) return const [];
    final rnd = Random();
    // Fisher-Yates shuffle subset
    final list = List<MufrodatEntry>.from(all);
    for (int i = list.length - 1; i > 0; i--) {
      final j = rnd.nextInt(i + 1);
      final tmp = list[i];
      list[i] = list[j];
      list[j] = tmp;
    }
    return list.take(count).toList();
  }
}

